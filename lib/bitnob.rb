# frozen_string_literal: true

require_relative 'bitnob/objects/customer'
require_relative 'bitnob/version'
require_relative 'bitnob/modules/base_endpoints'
require_relative 'bitnob/errors'

class Bitnob
  attr_accessor :public_key, :secret_key, :webhook_secret, :production, :url

  def initialize(secret_key = nil, production: false)
    bitnob_sandbox_url = BASE_ENDPOINTS::BITNOB_SANDBOX_URL
    bitnob_live_url = BASE_ENDPOINTS::BITNOB_LIVE_URL

    # set bitnob url to sandbox or live if we are in production or development
    @url = if production == false
             bitnob_sandbox_url
           else
             bitnob_live_url
           end

    base_url = -> { return url }

    @secret_key = if secret_key.nil?
                    ENV['BITNOB_SECRET_KEY']
                  else
                    secret_key
                  end

    warn 'Warning: To ensure your bitnob account api keys are safe,
    It is best to always set your keys in the environment variable'

    unless secret_key
      raise BitnobBadKeyError,
            'No secret key found. Please kindly make sure you set your secret key as
            an environment variable BITNOB_SECRET_KEY'
    end
  end
end
