module Slackbot
  class Chatter
    def initialize
      one_hour_ago = Time.now - (60*60)
      @db = Slackbot::Db.new(one_hour_ago)
    end

    def run
      puts "ctrl+c to exit"
      while true
        if update_db
          Slackbot.strategies.each do |strategy_const|
            strategy = strategy_const.new(@db)
            if strategy.should_post?
              strategy.post
            end
          end
        else 
          puts "No updates found"
        end
        sleep(10)
      end
    end

    def update_db
      @db.update
      @db.has_new_content?
    end
  end
end
