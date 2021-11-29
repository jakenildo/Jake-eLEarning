class Category < ApplicationRecord
    validates :title, :description, presence: true,
    length: { minimum: 3 }
    has_many :words, dependent: :destroy
    has_many :lessons, dependent: :destroy
end
