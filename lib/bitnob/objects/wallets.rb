# frozen_string_literal: true

require_relative 'base/base'
require 'json'

class Wallets < Base
  def fetch_wallets
    base_url = bitnob_object.base_url
    get_request("#{base_url}#{BaseEndpoints::ONCHAIN}")
  end

  def fetch_all_transactions(page_number: 1, limit: 10)
    base_url = bitnob_object.base_url
    get_request("#{base_url}#{BaseEndpoints::ONCHAIN}?order=ASC&page=#{page_number}&take=#{limit}")
  end

  def fetch_transaction(transaction_id)
    base_url = bitnob_object.base_url
    get_request("#{base_url}#{BaseEndpoints::ONCHAIN}/#{transaction_id}")
  end
end
