require 'rubygems'
require 'oauth'
require 'json'

class TwitterPoster

  def set_keys
    @consumer_key = OAuth::Consumer.new("VELNPCbdZrbixhjyuRkNPjNzb",
                                        "5H1wvS3GxISGBWeoQ7HfjfWmnBv3475YYq7HkSA1qX5iKGABFX")
    @access_token = OAuth::Token.new("3209369637-esfS47jyU9QYdr5frz5sye6zA3JP38pQl89TRFo",
                                     "VCnCg2Ooqwdy8r2QAAiUuULRO8ctowRK74jUE1GJcU4VF")
  end

  def post_function(str_post)
    baseurl = "https://api.twitter.com"
    path = "/1.1/statuses/update.json"
    address = URI("#{baseurl}#{path}")
    request = Net::HTTP::Post.new address.request_uri
    request.set_form_data(
               "status" => str_post,
    )

    http = Net::HTTP.new address.host, address.port
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request.oauth! http, @consumer_key, @access_token
    http.start
    response = http.request request

    tweet = nil
    if response.code == "200" then
      tweet = JSON.parse(response.body)
      puts "Tweeted!"
    else
      puts "Tweet fails"
    end

  end

end


twitterPoster = TwitterPoster.new
twitterPoster.set_keys

twitterPoster.post_function("HELLO #YTUBE TUTORIAL")