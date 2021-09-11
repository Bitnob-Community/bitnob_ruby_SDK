# frozen_string_literal: true

require_relative 'base/base'
require 'json'

class Lightning < Base
  def create_invoice(data)
    base_url = bitnob_object.base_url
    required_parameters = %w[description customerEmail tokens expires_at mtokens private
                             is_including_private_channels is_fallback_included]

    check_passed_parameters(required_parameters, data)
    payload = data.to_json

    post_request("#{base_url}#{BASE_ENDPOINTS::LN}/createinvoice", payload)
  end

  def pay_invoice(data)
    base_url = bitnob_object.base_url
    required_parameters = %w[request reference customerEmail description]

    check_passed_parameters(required_parameters, data)
    payload = data.to_json

    post_request("#{base_url}#{BASE_ENDPOINTS::LN}/pay", payload)
  end

  def initiate_payment(request)
    base_url = bitnob_object.base_url
    body = { 'request' => request }
    payload = data.to_json

    response = post_request("#{base_url}#{BASE_ENDPOINTS::LN}/initiatepayment", payload)

    return response

    def decode_payment_request(request)
      base_url = bitnob_object.base_url
      body = { 'request' => request }
      payload = data.to_json

      post_request("#{base_url}#{BASE_ENDPOINTS::LN}/decodepaymentrequest", payload)
    end

    def get_invoice(invoice_id)
      base_url = bitnob_object.base_url
      body = { 'id' => invoice_id }
      payload = data.to_json

      post_request("#{base_url}#{BASE_ENDPOINTS::LN}/getinvoice", payload)
    end
  end
end
