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
    def top_up(amount, cardId)
        payload = { amount: amount, cardId: cardId}
        post_request("#{base_url}#{BaseEndpoints::CARDS}/topup", payload.to_json)
    end

     # Withdraw From Card 
     # - Required Parameters
     #   amount: int
     #   CardID - uuid string
    def withdraw(amount, cardId)
        payload = { amount: amount, cardId: cardId}
        post_request("#{base_url}#{BaseEndpoints::CARDS}/withdraw", payload.to_json)
    end

     # Freeze Card
     # - Required Parameters
     #   CardID - uuid string
    def freeze(cardId)
        payload = { cardId: cardId}
        post_request("#{base_url}#{BaseEndpoints::CARDS}/freeze", payload.to_json)
    end

     # Unfreeze Card 
     # - Required Parameters
     #   CardID - uuid string
    def unfreeze(cardId)
        payload = { cardId: cardId}
        post_request("#{base_url}#{BaseEndpoints::CARDS}/unfreeze", payload.to_json)
    end

     # Mock Transaction 
     # - Required Parameters
     #   amount: int
     #   CardID - uuid string
     #   Type - string
    def mock_transaction(amount, cardId, type)
        payload = { amount: amount, cardId: cardId, type: type}
        post_request("#{base_url}#{BaseEndpoints::CARDS}/mock-transaction", payload.to_json)
    end

     # Terminate card
     # - Required Parameters
     #   CardID - uuid string
    def terminate(cardId)
        payload = {cardId: cardId}
        post_request("#{base_url}#{BaseEndpoints::CARDS}/terminate", payload.to_json)
    end

     # Block Card
     # - Required Parameters
     #   CardID - uuid string
    def block(cardId)
        payload = { cardId: cardId}
        post_request("#{base_url}#{BaseEndpoints::CARDS}/block", payload.to_json)
    end

     # Block Card
     # - Required Parameters
     #   CardID - uuid string
    def unblock(cardId)
        payload = { cardId: cardId}
        post_request("#{base_url}#{BaseEndpoints::CARDS}/unblock", payload.to_json)
    end
end