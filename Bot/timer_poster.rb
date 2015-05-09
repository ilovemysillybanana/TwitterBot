require 'rubygems'
require 'oauth'
require './quote_getter.rb'
require './twitter_poster.rb'

while(true) do
  sleep(200)
  quoteMachine = QuoteGetter.new
  tweet = Twitter_Poster.new
  tweet.set_keys
  tweet.post_function(quoteMachine.get_random_quote.split(' ')[0...-2].join(' ') + " #QuoteBotIsAGo")
  puts "Posted!"
end

puts 5
