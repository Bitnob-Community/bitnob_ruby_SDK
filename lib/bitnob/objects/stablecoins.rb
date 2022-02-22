require_relative 'base/base'

require 'json'

class StableCoin < Base
    # Sending USDC

    # - Required Parameters 

    #  data {

    #   amount : int
    #   address: string
    #   description: string 
    #   chain: "BSC"
    #   
    #   }

    def send_usdc(data)
        required_parameters = %w[amount address description chain]

        checked_passed_parameters(required_parameters, data)

        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::ONCHAIN}/send-usdc", payload)
    end


    # Sending USDT

    # - Required Parameters 

    #  data {

    #   amount : int
    #   address: string
    #   description: string 
    #   chain: "BSC"
    #   
    #   }

    def send_usdt(data)
        required_parameters = %w[amount address description chain]

        checked_passed_parameters(required_parameters, data)

        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::ONCHAIN}/send-usdt", payload)
    end

    # Creating USDC Address

    # - Required Parameters 

    #  data {

    #   label : string
    #   customerEmail: string
    #   chain: "BSC"
    #   
    #   }

    def create_usdc_address(data)
        required_parameters = %w[label customerEmail chain]

        checked_passed_parameters(required_parameters, data)

        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::ADDRESS}/generate/usdc", payload)
    end


    # Creating USDT Address

    # - Required Parameters 

    #  data {

    #   label : string
    #   customerEmail: string
    #   chain: "BSC"
    #   
    #   }

    def create_usdt_address(data)
        required_parameters = %w[label customerEmail chain]

        checked_passed_parameters(required_parameters, data)

        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::ADDRESS}/generate/usdt", payload)
    end
end 