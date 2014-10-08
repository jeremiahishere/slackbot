require "slackbot/version"

require "slackbot/chatter"
require "slackbot/db"

require "slackbot/api_requests/base"
require "slackbot/api_requests/history"

require "slackbot/strategies/base"
require "slackbot/strategies/hungry"
require "slackbot/strategies/cleverbot"
require "slackbot/strategies/linter"

module Slackbot

  def self.auth_token
    @auth_token ||= File.read('auth.token').chomp
  end

  def self.strategies
    @strategies # [Slackbot::Strategy::Hungry]
  end

  def self.channel
    @channel
  end

  def self.channel_type
    @channel_type
  end

  def self.setup(channel, channel_type, strategies)
    @channel = channel
    @channel_type = channel_type
    @strategies = strategies
  end
end
