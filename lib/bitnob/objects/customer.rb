# frozen_string_literal: true

require_relative "base/base.rb"
require 'json'

class Customer < Base

  def create_customer(data)
    base_url = bitnob_object.base_url

    required_parameters = ["firstName", "lastName", "email", "countyCode", "phone"]
    check_passed_parameters(required_parameters, data)
    payload = data.to_json

    response = post_request("#{base_url}#{BASE_ENDPOINTS::CUSTOMER}", payload)
    return response
  end

  def get_customer_by_email(email)
    base_url = bitnob_object.base_url
    body = { "email" => email}
    payload = body.to_json

    response = post_request("#{base_url}#{BASE_ENDPOINTS::CUSTOMER}/fetch_customer", payload)

    return response

  end

  def get_customer(customer_id)
    base_url = bitnob_object.base_url
    response = get_request("#{base_url}#{BASE_ENDPOINTS::CUSTOMER}/#{customer_id}")

    return response
  end


  def update_customer(customer_id, data)
    base_url = bitnob_object.base_url
    payload = data.to_json

    response = put_request("#{base_url}#{BASE_ENDPOINTS::CUSTOMER}/#{customer_id}", payload)
    return response
  end

end
