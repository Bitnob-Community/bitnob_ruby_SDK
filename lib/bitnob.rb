# frozen_string_literal: true

require_relative 'bitnob/objects/customer'
require_relative 'bitnob/version'
require_relative 'bitnob/modules/base_endpoints'
require_relative 'bitnob/errors'

class Bitnob
  attr_accessor :public_key, :secret_key, :webhook_secret, :production, :url

  def initialize(public_key = nil, secret_key = nil, webhook_secret = nil, production = false)
    bitnob_sandbox_url = BASE_ENDPOINTS::BITNOB_SANDBOX_URL
    bitnob_live_url = BASE_ENDPOINTS::BITNOB_LIVE_URL
    @public_key = if public_key.nil?
                    ENV['BITNOB_PUBLIC_KEY']
                  else
                    public_key
                  end

    # set bitnob url to sandbox or live if we are in production or development
    @url = if production == false
             bitnob_sandbox_url
           else
             bitnob_live_url
           end

    def base_url
      url
    end

    @secret_key = if secret_key.nil?
                    ENV['BITNOB_SECRET_KEY']
                  else
                    secret_key
                  end

    @secret = if webhook_secret.nil?
                ENV['WEBHOOK_SECRET']
              else
                secret
              end
    warn 'Warning: To ensure your bitnob account api keys are safe, It is best to always set your keys in the environment variable'

    if public_key.nil?
      raise BitnobBadKeyError,
            'No public key found. Please kindly make sure you set your public key as an environment variable BITNOB_PUBLIC_KEY'
    end

    if secret_key.nil?
      raise BitnobBadKeyError,
            'No secret key found. Please kindly make sure you set your secret key as an environment variable BITNOB_SECRET_KEY'
    end

    if webhook_secret.nil?
      raise BitnobBadKeyError,
            'No webhook secret found. Please kindly make sure you set your public key as an environment variable WEBHOOK_SECRET'
    end
  end
end
