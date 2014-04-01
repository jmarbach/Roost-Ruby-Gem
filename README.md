# Roost

This is the official Ruby GEM for the Roost API.

Roost is the easy way to send Safari Push Notifications to your website visitors.
Desktop Push Notifications provide a new marketing channel to drive visitors back to your site.
With Safari on OS X Mavericks, visitors receive notifications in the top right corner of their computer screen.
This ‘gentle’ touch is great for status updates or trending information. To learn more see roost.me


## Installation

Add this line to your application's Gemfile:

    gem 'roost'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roost

## Usage

To send notifications you first need to create an account on roost.me.

Then make sure you have ENV["ROOST_APPKEY"] and ENV["ROOST_APPSECRET"] set. These can be found in the Roost.me Dashboard under settings.
If you are using the Heroku Add-On these are already configured for you.

Once you have some registered Safari visitors on your site you can use the following code to send them a message.

response = Roost::API.send({alert:'Welcome to Roost',url:'http://roost.me'})
if response['success'] == true
    ..success..
else
    ..failure..
end


## Contributing

1. Fork it ( http://github.com/<my-github-username>/roost/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
