# frozen_string_literal: true

require_relative 'base/base'
require 'json'

class Checkout < Base
    # Create Hosted Checkout
    #
    # - Required Function Parameters:
    #
    #
    #       data: {
    #    amount: int ,
    #    customerEmail: string,
    #    notificationEmail: string,
    #    callbackUrl: string,
    #    successUrl: string,
    #    reference: string
    #     }
    #

    def create(data)
        required_parameters = %w[amount, customerEmail, notificationEmail, callbackUrl, successUrl, reference]

        checked_passed_parameters(required_parameters, data)
        payload = data.to_json
        post_request("#{base_url}#{BaseEndpoints::CHECKOUT}", payload)
    end

    # List All Hosted Checkout
    #
    # - Optional Function Parameters:
    #   page : int
    #   limit : int 
    #   order: string ASC or DESC

    def list_checkouts(page=1, limit=10, order='ASC')
        get_request("#{base_url}#{BaseEndpoints::CHECKOUT}/?order=#{order}&page=#{page}&limit=#{limit}")

    end

    # Get Hosted Checkout Info
    #
    # - Required Function Parameters:
    #   id : int

    def get_info(id)
        get_request("#{base_url}#{BaseEndpoints::CHECKOUT}/info/#{id}")
    end

    # Get Hosted Checkout Status
    #
    # - Required Function Parameters:
    #   id : int

    def get_status(id)
        get_request("#{base_url}#{BaseEndpoints::CHECKOUT}/status/#{id}")
    end
end