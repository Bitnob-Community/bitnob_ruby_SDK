require_relative 'base/base'

require 'json'

class Swap < Base 

    # Swap BTC for USD

    # - Required Parameters 

    #   amount : int  

    def swap_btc_usd(amount)
        data = { amount: amount }
        payload = data.to_json

        post_request("#{base_url}#{BaseEndpoints::ONCHAIN}/swap-bitcoin-usd", payload)
    end

    # Swap USD for BTC

    # - Required Parameters 

    #   amount : int  

    def swap_usd_btc(amount)
        data = { amount: amount }
        payload = data.to_json

        post_request("#{base_url}#{BaseEndpoints::ONCHAIN}/swap-usd-bitcoin", payload)
    end
    
    