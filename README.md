# Bitnob
---
This is a Ruby gem for easy integration of Bitnob For Business API for various applications written in Ruby language from Bitnob.

[![SDK CI](https://github.com/bitnob/bitnob_ruby_SDK/actions/workflows/main.yml/badge.svg)](https://github.com/bitnob/bitnob_ruby_SDK/actions/workflows/main.yml)

## Getting started

### Requirements
This gem requires Ruby 2.6+ and Rails 5.2+

### Installation 
- Add the following to your gem file:
```ruby
        gem 'bitnob', '~> 0.0.2'
```
Then run:

```ruby
        bundle install
```

### Usage 
- To use this SDK, you need to create a new Bitnob class with your API secret key gotten from your dashboard settings. We recommend you store such keys in an environment variable name `BITNOB_API_KEY`. Instantiating such object would look like this 


By default the package assumes that you are currently working using a sandbox credential in development, however to go live, your `secret key` nust be a production-grade secret key and you need to specify `true` when instantiating your bitnob class like this:

```ruby
    require 'bitnob'

    wallet = Wallet.new(true) # production
   get_wallets = wallet.fetch_wallets
   p get_wallets.body

    # Sandbox environment 

    wallet = Wallet.new 
    
    get_transaction = wallet.fetch_all_transactions
   p get_transaction.body
```

`NOTE`: It is best practice to always set your API keys to your environment variable for security purpose. Please be warned not use this package without setting your API keys in your environment variables in production.

### Bitnob Functions
- Before making use of any bitnob functions, it is expected you instantiate a new Function class and pass production as true to whatever function you wish to perform. Below is a demonstration:

- `Customer.new(true)`
- `Lightning.new(true)`
- `Onchain.new(true)`
- `Wallets.new(true)`


#### Customers

- To manage customers on your Bitnob for business in your ruby application, simply follow the instruction at the beginning of this sub-heading and instantiate a new `Customer` class.
    - The following functions are available:
        - create_customer
        - get_customer_by_email 
        - get_customer 
        - update_customer

### Lightning
- To create Lightning Transactions, simply follow the instruction at the beginning of this sub-heading and instantiate a new `Lightning` class.
    - The following functions are available:
        - create_invoice
        - pay_invoice 
        - initiate_payment
        - decode_payment request 
        - get_invoice


###### Full Transaction Workflow 
```ruby
    require 'bitnob'

    ln = Lightning.new(true)

    payload = {
        customerEmail: "parah@bitnob.com",
        description: "Dorime for Nonso and Tumise",
        tokens: 300,
        expires_at: "24h",
    }

    # Create a lightning invoice 

   new_ln_invoice = ln.create_invoice(payload)
    
```
### Onchain 
- To create Onchain Transactions, simply follow the instruction at the beginning of this sub-heading and instantiate a new `Onchain` class.
    - The following functions are available:
        - send_bitcoin
        - generate_address
        - list_addresses


#### Full Transaction Workflow

```ruby

    require 'bitnob'

    on_chain = Onchain.new(true)

    payload = {
        customerEmail: "parah@bitnob.com",
        satoshis: 30000,
        address: "btcjshlidlsidskdslisidsdosilsdmxksjsjldksossjoioidjifkji.zjijsi",
        description: "Go buy your momma a house!",
        priorityLevel: "regular"
    }

    # Send bitcoin using onchain 

    new_onchain = on_chain.send_bitcoin(payload)

```

### Wallets 
- To get wallets information, simply follow the instruction at the beginning of this sub-heading and instantiate a new `Wallets` class.
    - The following functions are available:
        - fetch_wallets
        - fetch_all_transactions
        - fetch_transaction



### Webhook Authentication

- You simply check to see if your webhook requests returns the appropriate body by simply doing this 

```ruby 

        require 'bitnob'

        check_webhook = webhook_authentication(requests) # return true or false
```

### Important Note

- it is important that response from each function returns both the response headers, body and status code. To work with only the reponse body simply call the `BODY` object after each function call :

```ruby
     require 'bitnob'

    wallet = Wallet.new(true) # production
   get_wallets = wallet.fetch_wallets
   p get_wallets.body # fetches response body
   p get_wallets.headers # fetches response headers


```

## Development 

After checking out the repo, run `bin/setup` to install dependencies. Then, run rake spec to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the .gem file to rubygems.org.


## Contributing 

Bug reports and pull requests are welcome on GitHub at [https://github.com/bitnob/bitnob_ruby_SDK](https://github.com/bitnob/bitnob_ruby_SDK). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct. Simply create a new branch and raise a Pull Request, we would review and merge. 

## License

The gem is available as open source under the terms of the [BSD License](https://opensource.org/licenses/BSD-3-Clause)

