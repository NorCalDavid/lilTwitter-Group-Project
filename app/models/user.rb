###########################################
### User Model
###########################################
require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  has_many :urls
  has_many :tweets

  validates :name, :presence => true, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # Did Not Work # has_many :followers, class_name => 'Follower', :foreign_key => 'user_id'
  # Did Not Work # has_many :following, class_name => 'Follower', :foreign_key => 'follower_id'
  has_many :tweets

  ### Following Relationships
  ###########################################

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed

  ### Follower Relationships
  ###########################################

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end
