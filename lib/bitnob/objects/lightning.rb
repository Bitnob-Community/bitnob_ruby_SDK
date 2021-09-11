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

  def pay_invoice(data); end
end
