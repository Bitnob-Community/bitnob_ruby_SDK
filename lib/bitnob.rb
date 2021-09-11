# frozen_string_literal: true
require_relative 'bitnob/objects/customer'
require_relative 'bitnob/version'
require_relative 'bitnob/modules/base_endpoints'
require_relative 'bitnob/errors'

class Bitnob
  attr_accessor :public_key, :secret_key, :webhook_secret, :production, :url

  def initialize(public_key=nil, secret_key=nil, webhook_secret=nil, production=false)
    bitnob_sandbox_url = BASE_ENDPOINTS::BITNOB_SANDBOX_URL
    bitnob_live_url = BASE_ENDPOINTS::BITNOB_LIVE_URL
    if(public_key.nil?)
      @public_key=ENV['BITNOB_PUBLIC_KEY']
    else
      @public_key=public_key
    end

    # set bitnob url to sandbox or live if we are in production or development
    if production == false
        @url =  bitnob_sandbox_url
    else
        @url = bitnob_live_url
    end

    def base_url
      return url
    end

    if(secret_key.nil?)
      @secret_key=ENV['BITNOB_SECRET_KEY']
    else
      @secret_key=secret_key
    end

    if(webhook_secret.nil?)
      @secret=ENV['WEBHOOK_SECRET']
    else
      @secret=secret
    end
     warn "Warning: To ensure your bitnob account api keys are safe, It is best to always set your keys in the environment variable"

    unless !public_key.nil?
      raise BitnobBadKeyError, "No public key found. Please kindly make sure you set your public key as an environment variable BITNOB_PUBLIC_KEY"
    end

    unless !secret_key.nil?
      raise BitnobBadKeyError, "No secret key found. Please kindly make sure you set your secret key as an environment variable BITNOB_SECRET_KEY"
    end

    unless !webhook_secret.nil?
      raise BitnobBadKeyError, "No webhook secret found. Please kindly make sure you set your public key as an environment variable WEBHOOK_SECRET"
    end


end
