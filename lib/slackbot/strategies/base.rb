module Slackbot
  module Strategy
    class Base
      def initialize(db)
        @db = db
        @channel = Slackbot.channel
        @channel_type = Slackbot.channel_type
      end

      def should_post?
        false
      end

      def post
        throw "Need to override the post method"
      end
    end
  end
end
