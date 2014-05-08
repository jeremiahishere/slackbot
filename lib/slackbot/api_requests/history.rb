module Slackbot
  module ApiRequest
    class History < ::Slackbot::ApiRequest::Base
      def initialize(payload)
        if Slackbot.channel_type == :group
          endpoint = "groups.history"
        else
          endpoint = "channels.history"
        end

        super(endpoint, payload)
      end
    end
  end
end
