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
        gem 'bitnob', '~> 0.0.1'
```
Then run:

```ruby
        bundle install
```

### Usage 

### Instantiate a Bitnob object 
- To use this SDK, you need to create a new Bitnob class with your API secret key gotten from your dashboard settings. We recommend you store such keys in an environment variable name `BITNOB_SECRET_KEY`. Instantiating such object would look like this 

> nob_pay = Bitnob.new  

Now this will throw a `BitnobBadKeyError` if you do not specify a secret key in the instantiation or set it as an environment variable.

To Instatntiate it with an environment variable, you simply do this:

> nob_pay = Bitnob.new('sk.-x-x-x-x-x-x-')

By default the package assumes that you are currently working using a sandbox credential in development, however to go live, your `secret key` nust be a production-grade secret key and you need to specify `true` when instantiating your bitnob class like this:

> nob_pay = Bitnob.new('sk.-x-x-x-x-', true)

or 

> nob_pay = Bitnob.new(production: true)

`NOTE`: It is best practice to always set your API keys to your environment variable for security purpose. Please be warned not use this package without setting your API keys in your environment variables in production.

### Bitnob Functions
- Before making use of any bitnob functions, it is expected you instantiate a new Bitnob class and pass that new instantiation as an object to whatever function you wish to perform. Below is a demonstration:

> nob_pay = Bitnob.new(production: true)

> ln = Lightning.new(nob_pay)

- `Customer.new(nob_pay)`
- `Lightning.new(nob_pay)`
- `Onchain.new(nob_pay)`
- `Wallets.new(nob_pay)`


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

    nob_pay = Bitnob.new(production: true)

    ln = Lightning.new(nob_pay)

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

    nob_pay = Bitnob.new(production: true)

    on_chain = Onchain.new(nob_pay)

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



## Development 

After checking out the repo, run `bin/setup` to install dependencies. Then, run rake spec to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the .gem file to rubygems.org.


## Contributing 

Bug reports and pull requests are welcome on GitHub at [https://github.com/bitnob/bitnob_ruby_SDK](https://github.com/bitnob/bitnob_ruby_SDK). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct. Simply create a new branch and raise a Pull Request, we would review and merge. 

## License

The gem is available as open source under the terms of the [BSD License](https://opensource.org/licenses/BSD-3-Clause)

