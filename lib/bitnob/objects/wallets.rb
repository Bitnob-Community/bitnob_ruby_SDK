# frozen_string_literal: true

require_relative 'base/base'
require 'json'

class Wallets < Base

  # fetch all wallets
  def fetch_wallets
    get_request("#{base_url}#{BaseEndpoints::ONCHAIN}")
  end

  # page_number: number, limit: number
  # default_value: page_number: 1, limit: 10
  def fetch_all_transactions(page_number=1, limit=10)
    get_request("#{base_url}#{BaseEndpoints::ONCHAIN}?order=ASC&page=#{page_number}&take=#{limit}")
  end

  # transaction_id: string
  def fetch_transaction(transaction_id)
    get_request("#{base_url}#{BaseEndpoints::ONCHAIN}/#{transaction_id}")
  end

  # Recommend btc fees
  def recommend_btc_fees()
    get_request("#{base_url}#{BaseEndpoints::ONCHAIN}/recommend-fees/btc")
  end
end
