class User < ActiveRecord::Base

    has_many :finsatgram_posts
    has_many :comments
    has_many :likes
    
end