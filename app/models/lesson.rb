class Lesson < ApplicationRecord
  has_many :users
  has_many :categories
  has_many :answers
end
