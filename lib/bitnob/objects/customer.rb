# frozen_string_literal: true

require_relative 'base/base'
require 'json'

class Customer < Base
  # -<tt>Required Parameters</tt>
  #
  #
  #      data: {
  #     firstName: string(required),
  #     lastName: string(optional),
  #     email: string(required),
  #     countryCode: number(+234)(optional),
  #     phone: number(optional)
  #        }
  def create_customer(data)
    required_parameters = %w[firstName lastName email countryCode phone]
    check_passed_parameters(required_parameters, data)
    payload = data.to_json

    post_request("#{base_url}#{BaseEndpoints::CUSTOMER}", payload)
  end

  # <tt>Required Parameter</tt>
  #
  #       email: string
  def get_customer_by_email(email)
    body = { 'email' => email }
    payload = body.to_json

    post_request("#{base_url}#{BaseEndpoints::CUSTOMER}/fetch_customer", payload)
  end

  # <tt>Required Parameter</tt>
  #
  #    customer_id: string
  def get_customer(customer_id)
    get_request("#{base_url}#{BaseEndpoints::CUSTOMER}/#{customer_id}")
  end

  # -<tt>Required Parameters</tt>
  #
  #
  #      data: {
  #     firstName: string(required),
  #     lastName: string(optional),
  #     email: string(required),
  #     countryCode: number(+234)(optional),
  #     phone: number(optional)
  #        }
  def update_customer(customer_id, data)
    payload = data.to_json

    put_request("#{base_url}#{BaseEndpoints::CUSTOMER}/#{customer_id}", payload)
  end
end
