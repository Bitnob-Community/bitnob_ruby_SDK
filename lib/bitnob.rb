# frozen_string_literal: true


require_relative 'bitnob/objects/customer'
require_relative 'bitnob/objects/lightning'
require_relative 'bitnob/objects/onchain'
require_relative 'bitnob/objects/wallets'
require_relative 'bitnob/version'
require_relative 'bitnob/modules/base_endpoints'
require_relative 'bitnob/errors'


class Bitnob
  attr_accessor :secret_key, :production, :url

  def initialize(secret_key=nil , production=false)
    @secret_key = secret_key
    bitnob_sandbox_url = BaseEndpoints::BITNOB_SANDBOX_URL
    bitnob_live_url = BaseEndpoints::BITNOB_LIVE_URL

    # set bitnob url to sandbox or live if we are in production or development
    @url = if production == false
             bitnob_sandbox_url
           else
             bitnob_live_url
           end

    def base_url 
      url
    end

    if (secret_key.nil?)
      @secret_key = ENV['BITNOB_SECRET_KEY']
    else 
      @secret_key = secret_key
    end

    unless !@secret_key.nil?
      raise BitnobBadKeyError, "No secret key supplied and couldn't find any in environment variables. Make sure to set secret key as an environment variable BITNOB_SECRET_KEY"
    end

    unless @secret_key[0..2] == 'sk.'
      raise BitnobBadKeyError, "Invalid secret key #{@secret_key}"
    end
  end

    
end


