# frozen_string_literal: true

require_relative 'base/base'
require 'json'

class Cards < Base 

    # Register Card User
    # - Required Parameters
    #  data {

    #   idNumber : string ,
    #   customerEmail: string,
    #   idType: string,
    #   phoneNumber: string,
    #   firstName: string,
    #   lastName: string,
    #   userPhoto: string,
    #   city: string,
    #   state: string,
    #   country: string,
    #   zipCode: string,
    #   line1: string,
    #   amount: int
    #   }
    def register_user(data)

        required_params = %w[customerEmail, idNumber, idNumber, firstName, lastName, city, state, country, zipCode, line1]

        checked_passed_parameters(required_params, data)

        payload = data.to_json

        post_request("#{base_url}#{BaseEndpoints::CARDS}/registercarduser", payload)

    end


    # Create Card
    # - Required Parameters
    #   customerEmail: string
    def create (customerEmail)
        body = { customerEmail: customerEmail}
        post_request("#{base_url}#{BaseEndpoints::CARDS}", body.to_json)
    end
    
     # Topup Card 
     # - Required Parameters
     #   amount: int
     #   CardID - uuid string
     def top_up(amount, id)
        payload = { amount: amount, id: id}
        post_request("#{base_url}#{BaseEndpoints::CARDS}/topup", payload.to_json)
     end
end