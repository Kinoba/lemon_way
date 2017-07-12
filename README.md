# LemonWay

[![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://codeclimate.com/github/MesPetitsArtistes/lemon_way)

[![CircleCI](https://circleci.com/gh/MesPetitsArtistes/lemon_way/tree/master.svg?style=svg)](https://circleci.com/gh/MesPetitsArtistes/lemon_way/tree/master)

This gem is a client for the LemonWay API.

IMPORTANT : This gem is still in development and cannot be used in production at the moment.

First, you need to sign up and own a Lemonway account.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lemonway_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lemonway_ruby

## Configuration:

There are **3 required** paremeters => login / password / company

There are 2 optionals parameters => sandbox / language

If you work with **Rails** :
```ruby
# config/initializers/lemonway_ruby.rb
lemon_way_configuration = {
  login: ENV['LEMONWAY_LOGIN'],
  password: ENV['LEMONWAY_PASSWORD'],
  company: ENV['LEMONWAY_COMPANY']
}
lemon_way_configuration.merge!(sandbox: true) unless Rails.env.production?

LemonWay.configuration = lemon_way_configuration
```

## Middleware

Lemonway needs to know the IP and User-Agent of the request.

This gem provides a middleware: `LemonWay::Middleware` which add this informations for each requests.

If you work with **Rails**, this middleware is already added and you have nothing to do.

Otherwise, you will have to add this middleware by yourself.


## Usage

For information, every request with the gem will trigger a `LemonWay::LemonWayError` if the request is not satisfied.

You can rescue it like that :

```ruby
def get_lemon_way_wallet
  LemonWay::Wallet.get(id: 'UnknownId')
rescue LemonWay::LemonWayError => e
  # Do what you want
end
```

### Wallet

This module allows you to manage all your wallets:

* Wallet creation
* Wallet details modification
* Send KYC documents to Lemon Way
* Check wallet and KYC document status that have changed since a given date
* Check wallet details and balance
* Check balances that have changed since a given date
* Get the list of all transactions made on a wallet

Details of the [Wallet module](https://github.com/MesPetitsArtistes/lemon_way/wiki/Wallet).

### MoneyIn

This module allows you credit a wallet with the following means of payment:

* By card

Details of the [MoneyIn module](https://github.com/MesPetitsArtistes/lemon_way/wiki/MoneyIn).

### Form

This module allows you to manage form payment:

* Create a payment form
* Retrieve a payment form
* Disable a payment form

Details of the [Form module](https://github.com/MesPetitsArtistes/lemon_way/wiki/Form).

### MoneyOut

This module allows you to prepare/debit a wallet to credit a bank account:

* Register an IBAN
* Transfer fund
* Get details on a transfer

Details of the [MoneyOut module](https://github.com/MesPetitsArtistes/lemon_way/wiki/MoneyOut).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

