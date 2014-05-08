require "bundler/gem_tasks"
require 'slackbot'

task :test do
  Slackbot.setup("G029RFQA6", :group, [Slackbot::Strategy::Hungry])
  chat = Slackbot::Chatter.new
  chat.run
end
