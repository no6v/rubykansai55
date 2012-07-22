# encoding: UTF-8
require "readline"

RUBY_DESCRIPTION  # => "ruby 2.0.0dev (2012-07-14 trunk 36380) [x86_64-linux]"
Readline::VERSION # => "6.2"

commands = %w[:reauthorize :reconnect :reply :restart :retweeted_by_me :retweets_of_me :recent :reduce_friends :report_spam :retweet :retweeted_to_me :rt]
Readline.completion_proc = ->(input){commands.grep(/\A#{input}/)}
Readline.completion_append_character = nil
Readline.completion_append_character # => nil

IO.pipe do |r, w|
  Readline.input = r
  (w << ":r\t\te\t\tp\t\tl\t").close
  result = Readline.readline("⚡ ") # =>
  result # => ":reply"
end
# >> ⚡ :r
# >> :reauthorize      :reduce_friends   :restart          :retweeted_to_me
# >> :recent           :reply            :retweet          :retweets_of_me
# >> :reconnect        :report_spam      :retweeted_by_me  :rt
# >> ⚡ :re
# >> :reauthorize      :reduce_friends   :restart          :retweeted_to_me
# >> :recent           :reply            :retweet          :retweets_of_me
# >> :reconnect        :report_spam      :retweeted_by_me
# >> ⚡ :rep
# >> :reply        :report_spam
# >> ⚡ :reply
