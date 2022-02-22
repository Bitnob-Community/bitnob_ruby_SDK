# frozen_string_literal: true

require_relative 'base/base'
require 'json'


class LNURL < Base
    # Create Lightning URL & LN address
    #
    # - Required Function Parameters:
    #
    #
    #       data: {
    #             identifier: string,
    #             identifierType: string,
    #             customerEmail: string,
    #             tld: string,
    #             image: string   #jpg,png,svg url link
    #             description: string,
    #             satMinSendable: int
    #             satMaxSendable: int
    #             }

    def create(data)
        required_parameters = %w[identifier identifierType tld image customerEmail description satMinSendable satMaxSendable]

        checked_passed_parameters(required_parameters, data)
        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::LNURL}", payload)
    end

    # Decoding LN URL 
    #
    # - Required Function Parameters:
    #     encoded_ln_url: string
    def decode_lnurl(encoded_ln_url)
        payload = {encodedLnUrl: encoded_ln_url}
        post_request("#{base_url}#{BaseEndpoints::LNURL}", payload.to_json)
    end

    # PAY LNURL 
    #
    # - Required Function Parameters:
    #
    #
    #       data: {
    #             
    #             encodedLnUrl: string,
    #             customerEmail: string,
    #             satoshis: int,
    #             reference: string,
    #             comment: string // optional 
    #             }
    def pay_lnurl(data)
        required_parameters = %w[encodedLnUrl customerEmail satoshis reference ]
        checked_passed_parameters(required_parameters, data)
        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::LNURL}/paylnurl", payload)
    end

    # CREATE LN WITHDRAWAL
    #
    # - Required Function Parameters:
    #
    #
    #       data: {
    #             
    #             customerEmail: string,
    #             satoshis: int,
    #             description: string,
    #             }
    def ln_withdrawal(data)
        required_parameters = %w[description customerEmail satoshis ]
        checked_passed_parameters(required_parameters, data)
        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::LNURL}/createLnUrlWithdrawal", payload)
    end

    # DECODE LN ADDRESS
    #
    # - Required Function Parameters:
    #
    #
    #       data: {
    #             
    #             lnAddress: string,
    #             }
    def decode_ln_address(data)
        required_parameters = %w[lnAddress]
        checked_passed_parameters(required_parameters, data)
        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::LNURL}/decodelnaddress", payload)
    end


    # PAY LIGHTNING ADDRESS
    #
    # - Required Function Parameters:
    #
    #
    #       data: {
    #             lnAddress: string,
    #             customerEmail: string,
    #             satoshis: int,
    #             reference: string
    #             }
    def pay_ln_address(data)
        required_parameters = %w[lnAddress customerEmail satoshis reference ]
        checked_passed_parameters(required_parameters, data)
        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::LNURL}/paylnaddress", payload)
    end

    # get all lnurls
    def get_lnurls()
        get_request("#{base_url}#{BaseEndpoints::LNURL}/")
    end

    # Get lnurl by identifier e.g email, username
    def get_by_identifier(identifier)
        get_request("#{base_url}#{BaseEndpoints::LNURL}/fetchlnurl/#{identifier}")
    end

    # Get lnurl by id
    def get_id(id)
        get_request("#{base_url}#{BaseEndpoints::LNURL}/#{id}")
    end

    # PAY LNURL 
    #  
    # - Required Function Parameters:
    #   
    #       id, 
    #       data: {
    #             identifier: string,
    #             customerEmail: string,
    #             tld: string,
    #             image: string   #jpg,png,svg url link
    #             description: string,
    #             satMinSendable: int
    #             satMaxSendable: int
    #             }
    def update_lnurl(id, data)
        required_parameters = %w[identifier customerEmail tld image description satMinSendable satMinSendable ]
        checked_passed_parameters(required_parameters, data)
        put_request("#{base_url}#{BaseEndpoints::LNURL}/#{id}")
    end
end