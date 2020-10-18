class Choice < ApplicationRecord
  belongs_to :word
  validates :word_id, presence: true
  validates :word, presence: true, length:  { maximum: 20 }
end
