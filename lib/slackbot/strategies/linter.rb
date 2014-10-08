module Slackbot
  module Strategy
    class Linter < ::Slackbot::Strategy::Base
      def search_terms
        ["```"]
      end

      # now with side effects
      def should_post?
        @messages_with_code = []
        @db.new_content.each do |message|
          search_terms.each do |term|
            if message.has_key?("text") && message["text"].include?(term) && !message['text'].include?('offense detected')
              @messages_with_code << message
            end
          end
        end
        return @messages_with_code.any?
      end

      def post
        @messages_with_code.each do |message|
          if message['text'].match(/```(.*)```/m)
            code = $1

            status = 0
            linter_output = ""

            Tempfile.open('my.file') do |file|
              file.write(code)
              file.close

              command = "bundle exec rubocop #{file.path}"
              linter_output = '```' + `#{command}` + '```'
              status = $?.exitstatus
            end

            if status > 0 && !linter_output.empty?
              chat_request = ApiRequest::Base.new("chat.postMessage", {username: "LintBot 1.0", text: linter_output})
              chat_request.make_request
            end
          end
        end
      end
    end
  end
end
