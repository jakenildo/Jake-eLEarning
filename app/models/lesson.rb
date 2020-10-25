class Lesson < ApplicationRecord
  has_one :users
  has_many :categories
  has_many :answers
end
