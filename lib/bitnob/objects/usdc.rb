require_relative 'base/base'

require 'json'

class USDC < Base
    # Sending USDC

    # - Required Parameters 

    #  data {

    #   amount : int
    #   address: string
    #   description: string 
    #   
    #   }

    def send(data)
        required_parameters = %w[amount, address, description]

        checked_passed_parameters(required_parameters, data)

        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::ONCHAIN}/send-usdc", payload)
    end

    # Creating Address

    # - Required Parameters 

    #  data {

    #   label : string
    #   customerEmail: string
    #   
    #   }

    def create_address(data)
        required_parameters = %w[label, customerEmail]

        checked_passed_parameters(required_parameters, data)

        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::ADDRESS}/generate/usdc", payload)
    end
end 