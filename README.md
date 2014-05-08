# Slackbot

Create chat bots for slack.


## Usage

Get your auth token from https://api.slack.com/.  Put it into slackbot/auth.token.
Get the channel you want to post to with something like:

    curl https://slack.com/api/groups.list -d "channel=G029RFQA6&token=<my_token>

or 

    curl https://slack.com/api/channels.list -d "channel=G029RFQA6&token=<my_token>

Copy the id field into the rake file as a setup method parameter

Add a strategy by making a new file in the strategies directory that implements the should_post? and post methods.  Then add it to the list of strategies in the Slackbot setup method.


## Contributing

1. Fork it ( http://github.com/<my-github-username>/slackbot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
