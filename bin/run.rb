require 'bundler/setup'
Bundler.setup(:default, :ci)
require 'activerecord-suppress_range_error'
require 'yaml'
keys = {}
puts "Welcome to the twitter follower CLI"
puts "please enter your ACCESS TOKEN:"
keys['ACCESS_TOKEN'] = gets.chomp
puts "thank you"
puts "please enter your ACCESS_TOKEN_SECRET:"
keys['ACCESS_TOKEN_SECRET'] = gets.chomp
puts "thank you"
puts "please enter your CONSUMER_KEY:"
keys['CONSUMER_KEY'] = gets.chomp
puts "thank you"
puts "please enter your CONSUMER_SECRET:"
keys['CONSUMER_SECRET'] = gets.chomp
puts "thank you"
File.open('application1.yml', 'w') do |f| f.write keys.to_yaml end
puts "would you like to begin storing your friends data? This may take a while...(y/n)"
require_relative '../config/environment'
answer = gets.chomp
if answer == "y"
Follower.store_followers_in_sql
elsif answer == "n"
puts "ok, have a nice day"
end
File.delete('application1.yml')
