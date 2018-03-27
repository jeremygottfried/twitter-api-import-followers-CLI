# twitter-api-import-followers-CLI
A simple CLI to put your twitter followers into an Active Record database 

To run the program, change directories so you are inside twitter-api-import-followers-CLI, run bundle install,
then type ruby bin/run.rb in your command line. 

The program will ask you for your twitter API authorization keys. 
To get new keys, create a twitter app here: https://apps.twitter.com/

The import may take a couple hours because of Twitter API's rate limits. 
To quit the program, press ctrl+z. All the users you've already imported will be saved in Twitter.db. 
You can access this file in sqlite3 by typing sqlite3 twitter.db. 

To run some of the other methods type 'rake console' and check out the methods in app/models/followers.rb 

Follower.count_words_in_description ===>sorted list of keywords and their counts in users' descriptions
Follower.count_words_in_status ====> sorted list of keywords and their counts in users' most recent statuses
Follower.hashtag_count ====> sorted list of hashtags and their counts in users' most recent statuses 
Follower.count_loacation_of_friends ====> sorted list of followers' locations and their counts 
