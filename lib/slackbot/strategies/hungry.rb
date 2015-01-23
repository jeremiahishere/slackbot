module Slackbot
  module Strategy
    class Hungry < ::Slackbot::Strategy::Base
      def search_terms
        ["food", "lunch", "hungry", "eat", "ate", "eaten", "pizza", "tacos", "subs", "breakfast"]
      end

      def should_post?
        @db.new_content.each do |message|
          search_terms.each do |term|
            if message.has_key?("text") && message["text"].downcase.include?(term)
              return true
            end
          end
        end
        return false
      end

      def post
        chat_request = ApiRequest::Base.new("chat.postMessage", {username: "Ghost of Jeremiah", text: "I already ate lunch"})
        chat_request.make_request
      end
    end
  end
end
