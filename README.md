# OmniAuth Zendesk

This gem contains the Zendesk strategy for OmniAuth.

Zendesk uses the HTTPBasic Authentication flow, you can read about it here: [Zendesk API - Security and Authentication](http://developer.zendesk.com/documentation/rest_api/introduction.html#security-and-authentication)

## How To Use It

Add the strategy to your `Gemfile`:

    gem 'omniauth-zendesk'

Or you can pull it directly from github eg:

    gem 'omniauth-zendesk', :git => 'https://github.com/tstachl/omniauth-zendesk.git'

For a Rails application you'd now create an initializer `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :zendesk, :site => 'https://yoursite.zendesk.com' 
    end

For Sinatra you'd add this 3 lines:

    use OmniAuth::Builder do
      provider :zendesk, :site => 'https://yoursite.zendesk.com'
    end

## License

Copyright (c) 2013 Thomas Stachl <tom@desk.com>, Desk.com - A Salesforce.com Company

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.