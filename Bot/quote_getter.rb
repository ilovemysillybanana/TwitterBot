#Author: Jose Tobar
#Purpose: This a Ruby API for the website, iheartquotes.com


require 'open-uri'
require 'json'
require 'rubygems'
#require 'pp'

class QuoteGetter
  def get_random_quote
    site = open('http://www.iheartquotes.com/api/v1/random')
    @@random_quote = site.read
    return @@random_quote
  end
end

=begin
@rr = QuoteGetter.new
puts @rr.get_random_quote.split(' ')[0...-2].join(' ')
=end