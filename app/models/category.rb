class Category < ApplicationRecord
    validates :title, :description, presence: true,
    length: { minimum: 3 }
    has_many :words, dependent: :destroy
    belongs_to :lesson
end
