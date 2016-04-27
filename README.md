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

### Basic Send

Easily send notifications through Roost. Notifications must include text (alert) and a landing page URL (url).

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

### Sending With Parameters

It is possible to target segments of your subscribers, or even individuals, and send scheduled notifications or advanced tests on notification sending. You must first have set these segments or identifiers via our [JavaScript API](http://docs.goroost.com/v1.0/docs/api-basics).

#### Accepted Parameters

| Key Name | Description |
| :--- | :--- |
| segments | List of Segments. If included, notification will be sent only to subscribers associated with one or more of the listed Segments.|
| aliases | List of user Aliases. If included, notification will be sent only to subscribers listed. |
| device_tokens | List of device tokens on which users registered. If included, notification will be sent only to devices listed. |
| exclude_tokens | List of device tokens. If included, devices listed will be excluded when the notification is sent. |
| test_type | Specifies that progressive A/B split-testing will be done to optimize delivery. If included, value must be: 'MULTI_ARM_BANDIT'. In this case, alert must also be specified as an array with a list of alternate titles (EX: ['A Notification Title', 'Alternate Title', 'Third Title']). |
| schedule_for | Time when the notification will be scheduled for delivery. Format: "YYYY-MM-DDTHH:mm:SSZ". Time is specified in Zulu/GMT. **Example:** '2015-06-20T08:00:00Z' |
| imageURL | URL of image which is displayed with the notification and in the Bell notification center. |

```
alert = 'Thanks for subscribing for notifications'
url = 'https://goroost.com'
aliases = ['dan@abc123.com', 'burton@xyz456', 'sattles@lmno789.com']
device_tokens = ['abcdefg123456789', '987654321gfedcba']
exclude_tokens = ['lmnopqrs789']
schedule_for = '2015-06-05T15:17:00Z'
segments = ['Story', 'News', 'Weather']
test_type = 'MULTI_ARM_BANDIT'
imageURL = 'http://url-of-your-custom-image'

response = Roost::API.send({alert: alert,url: url, segments: segments, schedule_for: schedule_for})

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
