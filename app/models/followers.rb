require 'activerecord-suppress_range_error'
class Follower < ActiveRecord::Base

    def self.store_followers_in_sql
      #create new Twitter client using my auth keys
      me = TwitterApi.new
      #run the get_followers function to get a list of my followers' data from the Twitter API
      followers = me.get_followers
      #iterate through my followers list and store their data using Active record
      followers.each do |follower|
        #grab the attributes hash of each follower
        attrs = follower.attrs
        #move some of the nested attributes to the top level of the hash
        if attrs[:entities][:url] != nil
          attrs[:website] = attrs[:entities][:url][:urls][0][:expanded_url]
        end
        if attrs[:status]
          if attrs[:status][:text]
            attrs[:status_text] = attrs[:status][:text]
          end
          if attrs[:status][:created_at]
            attrs[:status_time] = attrs[:status][:created_at]
          end
        end
        #set my id to twitter_id so it doesn't rewrite my table id
        attrs[:twitter_id] = attrs[:id]
        attrs.delete(:id)
        #delete nested hashes so they don't return errors from active record's initialize method
          attrs.delete(:status)
          attrs.delete(:entities)
          attrs.delete(:extended_entities)
          #check to see if the follower already exists in your database
        if Follower.find_by(name: attrs[:name])
          ok = "ok"
        else
          #create a new follower and assign all attributes from the Twitter API
        user = Follower.new(attrs)
        user.save
        end
      #wait 3.5 seconds to import the next user so you don't reach your Twitter API rate limit
      sleep(3.5)
      end
    end

  def self.count_words_in_description
    #create a hash to count words
    count_hash = Hash.new(0)
    #iterate through every follower
    Follower.all.each do |user|
    # check if user description exists then split the description into an array of words
    if user.description != nil
      words = user.description.split(/ |\.|,|!|\?/)
      # some optional splits (/-|  |\.|!|@|:|,|<|>|"|;|\+|=|-|_|\$|\?|\*|\^|~|`|#|\(|\)/)
    #iterate through the words and increment the count in the hash
      words.each do |word|
        count_hash[word.downcase] += 1
        end
      end
    end
    #return the hash
    count_hash
  end

def self.count_words_in_status
  #create a hash to count words
    count_hash = Hash.new(0)
    #iterate through every follower
    Follower.all.each do |user|
      #check if user status exists then split the description into an array of words
  if user.status_text != nil
    words = user.status_text.split(/ |\.|,|!|\?/)
    #some optional splits (/-|  |\.|!|@|:|,|<|>|"|;|\+|=|-|_|\$|\?|\*|\^|~|`|#|\(|\)/)
    #iterate through the words and increment the count in the hash
    words.each{|word| count_hash[word.downcase] += 1 }
    end
  end
  #return the hash
  count_hash
end

def self.count_location_of_friends
  hash = Hash.new(0)
  Follower.all.each do |user|
if user.location != nil
  hash[user.location.downcase] += 1
end
end
hash.sort_by{|k,v| -v}
end

  def self.hashtag_count
    hash = self.count_words_in_status
    hash.select{|key, value| key[0] == "#"}.sort_by{|key, value| -value}
  end

#   def self.most_common_words_in_description
#     hash = self.count_words_in_description
#     hash.sort_by{|key, value| -value}
#     hash.first(30)
#   end
 end
