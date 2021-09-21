# frozen_string_literal: true

require 'httparty'
require_relative '../../modules/base_endpoints'
require 'json'
require_relative '../../errors'

class Base
  attr_accessor :secret_key, :production, :url

  def initialize(production = false)
    # - bitnob api key
    @secret_key = ENV['BITNOB_API_KEY']
    bitnob_sandbox_url = BaseEndpoints::BITNOB_SANDBOX_URL
    bitnob_live_url = BaseEndpoints::BITNOB_LIVE_URL

    # set bitnob url to sandbox or live if we are in production or development
    @url = if production == false
             bitnob_sandbox_url
           else
             bitnob_live_url
           end

    def base_url
      @url
    end

    if @secret_key.nil?
      raise BitnobBadKeyError,
            "No secret key supplied and couldn't find any in environment variables. Make sure to set secret key as an environment variable BITNOB_SECRET_KEY"
    end

    raise BitnobBadKeyError, "Invalid secret key #{@secret_key}" unless @secret_key[0..2] == 'sk.'
  end

  # make a get request
  def get_request(endpoint)
    response = HTTParty.get(endpoint, headers: { 'Authorization' => "Bearer #{@secret_key}" })
    begin
      unless response.code == 200 || response.code == 201
        raise BitnobServerError.new(response), "HTTP Code #{response.code}: #{response.body}"
      end

      raise BitnobServerError.new(response), "Server Message: #{response.message}" unless response.code != 0

      response
    rescue JSON::ParserError => e
      raise BitnobServerError.new(response),
            "Invalid result data. Could not parse JSON response body \n #{e.message}"
    end
  end

  # method to make a post request
  def post_request(endpoint, data)
    response = HTTParty.post(endpoint, {
                               body: data,
                               headers: {
                                 'Content-Type' => 'application/json',
                                 'Authorization' => "Bearer #{@secret_key}"
                               }
                             })

    unless response.code == 200 || response.code == 201
      raise BitnobServerError.new(response), "HTTP Code #{response.code}: #{response.body}"
    end

    response
  end

  # method to make a put request
  def put_request(endpoint, data)
    response = HTTParty.put(endpoint, {
                              body: data,
                              headers: {
                                'Content-Type' => 'application/json',
                                'Authorization' => "Bearer #{@secret_key}"
                              }
                            })

    unless response.code == 200 || response.code == 201
      raise BitnobServerError.new(response), "HTTP Code #{response.code}: #{response.body}"
    end

    response
  end

  # - Verify that passed parameter contains required parameters
  def check_parameters(required_params, passed_params)
    # This is used to check if the passed authorization parameters matches the required parameters
    required_params.each do |k, _v|
      unless passed_params.key?(k)
        raise IncompleteParameterError,
              "Parameters Incomplete, Missing Parameter: #{k}, Please pass in the complete parameter."
      end
    end
  end
end
