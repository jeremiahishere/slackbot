module Slackbot
  class Db
    def initialize(start_time)
      @posts = []
      @oldest = start_time.to_i
      @latest = Time.now.to_i
      @previous_latest = nil # most recent things from the previous search
    end

    def update
      @previous_latest = @latest
      @latest = Time.now.to_i

      history_request = ApiRequest::History.new({latest: @latest})
      history_request.make_request
      if history_request.ok?
        new_messages = history_request.response_body["messages"]
        puts "adding the following messages to the db"
        new_messages.each do |m| 
          puts m.inspect
          @posts.push(m) # pushing one at a time for now
        end
        # @posts += new_messages # at some point, push all at once
      end
    end

    def has_new_content?
      new_content.any?
    end

    def new_content
      @posts.select { |message| message["ts"].to_i >= @previous_latest && message["ts"].to_i <= @latest }
    end
  end
end
