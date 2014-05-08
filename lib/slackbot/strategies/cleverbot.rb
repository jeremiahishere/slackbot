require 'cleverbot-api'


# The cleverbot-api gem is broken.  Abandoning this for now
module Slackbot
  module Strategy
    class Cleverbot < ::Slackbot::Strategy::Base
      def initialize(db)
        super(db)
        @cleverbot = CleverBot.new # note capitalization
      end

      def should_post?
        return true
      end

      def post
        puts "cleverbotting"
        puts @cleverbot.think('hello world')
      end
    end
  end
end
