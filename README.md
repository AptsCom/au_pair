# AuPair

AuPair provides token-based authentication and versioning for Rails API applications.

## Installation

In your Gemfile:

    gem 'au_pair'

## API Authentication

AuPair's authentication functionality allows you to limit access to your API to those clients that provide
registered names and associated tokens through their request, either via headers or path variables.

For header-based authentication, clients must set the `api-vendor` and `api-token` headers.

For path-based authentication, clients pass in `api_token` and `api_vendor` parameters through the request.

To set up tokens, create a configuration file in config/initializers/au_pair.rb to specify client apps and their associated auth tokens:

    AuPair.configure do |config|

      config.tokens = {
        'my_sample_app' => '12345'
      }

    end

(Note that for security reasons, you probably want to read in the tokens from an environment variable as opposed to storing
them in your source code.)

Then in your application controller, or in individual controllers if you want to limit authentication to certain actions:

    class ApplicationController < ActionController::Base
      include AuPair::Authenticates
      before_filter :authenticate!
    end

## API Versioning Support

Specify groups of routes per API version In your routes file:

    constraints(AuPair::ApiConstraint.new('v1')) do
      resources :widgets
    end

Client apps can then specify the API version that they want to use by passing in an `api-version` header or an `api_version` URL parameter.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
