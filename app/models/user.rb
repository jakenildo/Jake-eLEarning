class User < ApplicationRecord
  # Followed Users
  has_many :active_relationships, foreign_key: "follower_id",
  class_name: "Relationship",
  dependent: :destroy

  has_many :followed_users, through: :active_relationships, source: :followed    

  # Followers
  has_many :passive_relationships, foreign_key: "followed_id",
    class_name: "Relationship",
    dependent: :destroy
    
  has_many :followers, through: :passive_relationships, source: :follower    
 
  validates :name, presence: true,
  length: { minimum: 3 }
  VALID_EMAIL_REGEX =
  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: {minimum: 6}

  has_many :words, dependent: :destroy
  has_many :choices, dependent: :destroy
  
  has_many :lessons, dependent: :destroy
  has_many :categories, through: :lessons

  # returns true if the current user is following the other user
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  # Follows a user
  def follow(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  # Unfollow a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
