require 'twitter'
require 'pry'

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application1.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end


def get_friends
thing = client.friends
end

def get_followers
  client.followers
end

  def most_recent_friend
    get_friends.first
    #find the twitter gem method that retrieves a user's friends and grab the most recent friend
  end

  def find_user_for(username)
    client.user(username)
    #find the twitter gem method that returns the correct user, given a username
  end

  def find_followers_for(username)
    client.followers(username).first(10).map{|user| user.to_h}
  end

  def homepage_timeline
    #find the twitter gem method that retreives the tweets from a user's timeline.
    client.home_timeline
    client.home_timeline.map{|tweet| tweet.text}
  end

  def count_location_of_friends
    locations = get_friends.map{|friend| friend.location}
    count = locations.inject(Hash.new(0)){|hash, key| hash[key] += 1; hash}
  end
end
