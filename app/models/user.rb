###########################################
### User Model
###########################################

class User < ActiveRecord::Base
  # has_many :followers, class_name => 'Follower', :foreign_key => 'user_id'
  # has_many :following, class_name => 'Follower', :foreign_key => 'follower_id'
  has_many :tweets
end
