require "roost/version"
require 'json'

module Roost
	class API
		def self.send(opts)
      opts = opts||{}

      key =  opts[:app_key]||ENV["ROOST_APPKEY"]
      secret = opts[:app_secret]||ENV["ROOST_APPSECRET"]

      raise "ROOST_APPKEY and ROOST_APPSECRET must be set as environment variables." if(key.nil? || key.empty? || secret.nil? || secret.empty?)
      raise "opts.alert must be given." if opts[:alert].nil? || opts[:alert].empty?
      raise "opts.url must be given." if opts[:url].nil? || opts[:url].empty?

      uri = URI.parse("https://get.roost.me/api/push")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
      request.basic_auth key,secret

      request.body = {
      		alert:opts[:alert],
      		url:opts[:url]
      }.to_json

      response = http.request(request)
      if response.code == "200"
        return JSON.parse(response.body)
      else
        return {
            "success"=>false,
            "message"=>response.message,
            "code"=>response.code
        }
      end
		end
	end
end
