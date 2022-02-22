# frozen_string_literal: true

require_relative 'base/base'
require 'json'

# - Making Payments Via Lightning
class Lightning < Base
  # Create Lightning invoice
  #
  # - Required Function Parameters:
  #
  #
  #       data: {
  #    description: string,
  #    customerEmail: string,
  #    tokens: number,
  #    expires_at: string
  #     }
  def create_invoice(data)
    required_parameters = %w[description customerEmail tokens expires_at]

    check_passed_parameters(required_parameters, data)
    payload = data.to_json

    post_request("#{base_url}#{BaseEndpoints::LN}/createinvoice", payload)
  end

  # Pay Lightning invoice
  #
  # - Required Function Parameters:
  #
  #
  #       data: {
  #    description: string,
  #    customerEmail: string,
  #    request: string,
  #     }

  def pay_invoice(data)
    required_parameters = %w[request customerEmail description]

    check_passed_parameters(required_parameters, data)
    payload = data.to_json

    post_request("#{base_url}#{BaseEndpoints::LN}/pay", payload)
  end

  # Initiate payment is advised to be run before paying an invoice to calculate fees and check if an invoice has expired.
  #
  # - Required Function Parameters:
  #
  #    request: string

  def initiate_payment(request)
    body = { request: request }
    payload = body.to_json

    post_request("#{base_url}#{BaseEndpoints::LN}/initiatepayment", payload)
  end

  # Decode a BOLT 11 compliant payment request
  #
  # - Required Function Parameters:
  #
  #    request: string

  def decode_payment_request(request)
    body = { request: request }
    payload = body.to_json

    post_request("#{base_url}#{BaseEndpoints::LN}/decodepaymentrequest", payload)
  end

  # Getting Lightning invoice data
  #
  # - Required Function Parameters:
  #
  #    invoice_id: string

  def get_invoice(invoice_id)
    body = { id: invoice_id }
    payload = body.to_json

    post_request("#{base_url}#{BaseEndpoints::LN}/getinvoice", payload)
  end

  # - Ln Pay
  #
  # - Required Function Parameters
  #  data: {
  #       request: "string",
  #       reference: "string",
  #       customerEmail: "string",
  #       description: "string"
  #       }

  def ln_pay(data)
    payload = data.to_json
    post_request("#{base_url}#{BaseEndpoints::LN}/pay", payload)
  end

  # - Probe For Route
  #
  # - Required Function Parameters
  #  data: {
  #       destination: "string",
  #       tokens: "string",
  #       total_mtokens: 0,
  #       payment: "string"
  #       }

  def probe_for_route(data)
    payload = data.to_json
    post_request("#{base_url}#{BaseEndpoints::LN}/probeforroute", payload)
  end

  # - Probe Route
  #
  def probe_route()
    payload= {}
    post_request("#{base_url}#{BaseEndpoints::LN}/proberoute", paylod.to_json)
  end
end
