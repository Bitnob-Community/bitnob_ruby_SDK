# frozen_string_literal: true

require 'bitnob/errors'

class Bitnob
  attr_reader :public_key, :secret_key, :secret, :production, :url

  def initialize(public_key=nil, secret_key=nil, secret=nil)
    if(public_key.nil?)
      @public_key=ENV['BITNOB_PUBLIC_KEY']
    else
      @public_key=public_key
    end

    if(secret_key.nil?)
      @secret_key=ENV['BITNOB_SECRET_KEY']
    else
      @secret_key=secret_key
    end

    if(secret.nil?)
      @secret=ENV['BITNOB_SECRET']
    else
      @secret=secret
    end
     warn "Warning: To ensure your bitnob account api keys are safe, It is best to always set your keys in the environment variable"


end
