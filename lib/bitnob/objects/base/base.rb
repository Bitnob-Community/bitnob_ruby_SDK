# frozen_string_literal: true

require 'httparty'
require_relative '../../modules/base_endpoints'

require 'json'
require_relative '../../errors'

class Base

  attr_reader :bitnob_object

  def initialize(bitnob_object=nil)
    unless bitnob_object.nil?
      raise ArgumentError, "You must specify an object or api operation!!"
    end
    @bitnob_object = bitnob_object
  end

  # make a get request
  def get_request(endpoint)
    begin
      response = HTTParty.get(endpoint, :headers => {"Authorization" => "Bearer #{bitnob_object.secret_key}" })
      unless (response.code == 200 || response.code == 201)
        raise BitnobServerError.new(response), "HTTP Code #{response.code}: #{response.body}"
      end
      return response

      unless(response.code != 0 )
        raise BitnobServerError.new(response), "Server Message: #{response.message}"
      end

      rescue JSON::ParserError => jsonerr
        raise BitnobServerError.new(response) , "Invalid result data. Could not parse JSON response body \n #{jsonerr.message}"
        return response
      end
  end

  # method to make a post request
  def post_request(endpoint, data)
    begin
      response = HTTParty.post(endpoint, {
        body: data,
        headers: {
          "Content-Type" => "application/json",
          "Authorization" =>  "Bearer #{bitnob_object.secret_key}"
        }
      })

      unless (response.code == 200 || response.code == 201)
        raise BitnobServerError.new(response), "HTTP Code #{response.code}: #{response.body}"
      end
      return response
    end

  end


  # method to make a put request
  def put_request(endpoint, data)
    begin
      response = HTTParty.put(endpoint, {
        body: data,
        headers: {
          "Content-Type" => "application/json",
          "Authorization" =>  "Bearer #{bitnob_object.secret_key}"
        }
      })

      unless (response.code == 200 || response.code == 201)
        raise BitnobServerError.new(response), "HTTP Code #{response.code}: #{response.body}"
      end
      return response
  end
end

  def check_parameters(required_params, passed_params)
    # This is used to check if the passed authorization parameters matches the required parameters
      required_params.each do |k, v|
      if !passed_params.key?(k)
        raise IncompleteParameterError, "Parameters Incomplete, Missing Parameter: #{k}, Please pass in the complete parameter."
      end
      end
  end

end
