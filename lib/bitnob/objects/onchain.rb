# frozen_string_literal: true

require_relative 'base/base'
require 'json'


# Handles all transactions via Onchain
class Onchain < Base
  # Onchain sending of bitcoin
  # 
  # - Required Function Parameters: 
  #
  #
  #       data: { 
  #    satoshis: number, 
  #    customerEmail: string, 
  #    address: string, 
  #    priorityLevel: string 
  #     } 
  #
  #
  # - Priority level is used to detect how long a transaction would take. Its default is regular
  def send_bitcoin(data)
    base_url = bitnob_object.base_url
    required_parameters = %w[satoshis customerEmail address]

    checked_passed_parameters(required_parameters, data)
    payload = data.to_json
    post_request("#{base_url}#{BaseEndpoints::ONCHAIN}/send_bitcoin", payload)
  end

  # Generates a temporary address for onchain transaction
  #
  # - Required Function Parameters: <tt>customer_email</tt>
  def generate_address(customer_email)
    base_url = bitnob_object.base_url
    body = { customerEmail: customer_email }
    payload = body.to_json
    post_request("#{base_url}#{BaseEndpoints::ADDRESS}/generate", payload)
  end

  # Returns a JSON data containing list of addresses
  #
  # - Required Function Parameters: <tt>page_number</tt> <tt>limit</tt>
  #
  #
  #     default: <tt>page_number => 1, limit => 10</tt>
  def list_addresses(page_number: 1, limit: 10)
    base_url = bitnob_object.base_url
    get_request("#{base_url}#{BaseEndpoints::ADDRESS}order=ASC&page=#{page_number}&take=#{limit}")
  end
end
