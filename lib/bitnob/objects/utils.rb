# frozen_string_literal: true

require 'openssl'
require 'digest'

# - Authenticates Webhook Requests
def webhook_authentication(request)
  webhook_secret = ENV['BITNOB_WEBHOOK_SECRET']
  signature = request.headers['x-bitnob-signature']
  digest = OpenSSL::Digest.new('Digest', 'sha512')

  hash = OpenSSL::HMAC.hexdigest(digest, webhook_secret, request.body)
  signature == hash
end
