# frozen_string_literal: true

require_relative 'base/base'
require 'json'

class Customer < Base
  def create_customer(data)
    base_url = bitnob_object.base_url

    required_parameters = %w[firstName lastName email countyCode phone]
    check_passed_parameters(required_parameters, data)
    payload = data.to_json

    post_request("#{base_url}#{BaseEndpoints::CUSTOMER}", payload)
  end

  def get_customer_by_email(email)
    base_url = bitnob_object.base_url
    body = { 'email' => email }
    payload = body.to_json

    post_request("#{base_url}#{BaseEndpoints::CUSTOMER}/fetch_customer", payload)
  end

  def get_customer(customer_id)
    base_url = bitnob_object.base_url
    get_request("#{base_url}#{BaseEndpoints::CUSTOMER}/#{customer_id}")
  end

  def update_customer(customer_id, data)
    base_url = bitnob_object.base_url
    payload = data.to_json

    put_request("#{base_url}#{BaseEndpoints::CUSTOMER}/#{customer_id}", payload)
  end
end
