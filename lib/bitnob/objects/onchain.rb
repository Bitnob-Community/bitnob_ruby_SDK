# frozen_string_literal: true

require_relative 'base/base'
require 'json'

class Onchain < Base
  def send_bitcoin(data)
    base_url = bitnob_object.base_url
    required_parameters = %w[satoshis customerEmail reference address description priorityLevel]

    checked_passed_parameters(required_parameters, data)
    payload = data.to_json
    post_request("#{base_url}#{BaseEndpoints::ONCHAIN}/send_bitcoin", payload)
  end

  def generate_address(customer_email)
    base_url = bitnob_object.base_url
    body = {customerEmail: customer_email}
    payload = body.to_json 
    post_request("#{base_url}#{BaseEndpoints::ADDRESS}/generate", payload)
  end

  def list_addresses(page_number: 1, limit: 10)
    base_url = bitnob_object.base_url
    get_request("#{base_url}#{BaseEndpoints::ADDRESS}order=ASC&page=#{page_number}&take=#{limit}")
  end
end
