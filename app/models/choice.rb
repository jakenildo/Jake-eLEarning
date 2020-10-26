class Choice < ApplicationRecord
  belongs_to :word
  validates :choices, presence: true, length:  { maximum: 20 }, uniqueness: { scope: :word }
end
