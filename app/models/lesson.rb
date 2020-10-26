class Lesson < ApplicationRecord
  has_one :users
  has_many :category
  has_many :answers
end
