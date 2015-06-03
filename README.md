# Roost

This is the official Ruby gem for the Roost API.

[Web Push by Roost](https://goroost.com) allows websites to send notifications to their site visitors for
updates about new posts, content, or other information. Available in Chrome (Android and desktop) and Safari (desktop).

## Installation

Add this line to your application's Gemfile:

    gem 'roost'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roost

## Usage

To send notifications you will first need to create an account on the [Roost website](https://goroost.com).

Set your Roost app key and app secret to the following environment variables: ENV["ROOST_APPKEY"] / ENV["ROOST_APPSECRET"]
These can be found in the [Roost dashboard](https://dashboard.goroost.com) under settings -> API.

Easliy send notifications through Roost. Notifications incule text (alert) and a landing page URL (url).
```
    alert = 'Thanks for subscribing for notifications'
    url = 'https://goroost.com'

    response = Roost::API.send({alert: alert,url: url})

    if response['success'] == true
        ..success..
    else
        ..failure..
    end
```

## Contributing

1. Fork it ( https://github.com/RoostPush/Roost-Ruby-Gem )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
