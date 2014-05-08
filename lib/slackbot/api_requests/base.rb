require 'net/http'
require 'json'

module Slackbot
  module ApiRequest
    class Base
      def initialize(endpoint, payload)
        @endpoint = endpoint
        @payload = { channel: Slackbot.channel, token: ::Slackbot.auth_token }.merge(payload)

        @url = "https://slack.com/api/"
      end

      def make_request
        uri = URI(@url + @endpoint)
        uri.query = URI.encode_www_form(@payload)

        # I tried and failed at Net:HTTP
        response = `curl "#{uri.to_s}"`
        begin  
          @response_body = JSON.parse(response)
        rescue Exception => e
          puts e.inspect
        end
      end

      def ok?
        @response_body.has_key?("ok") && @response_body["ok"]
      end

      def response_body
        @response_body
      end
    end
  end
end
