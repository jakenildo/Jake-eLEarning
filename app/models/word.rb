class Word < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true

  has_many :choice, dependent: :destroy
end
