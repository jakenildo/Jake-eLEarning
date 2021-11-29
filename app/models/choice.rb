class Choice < ApplicationRecord
  belongs_to :word
  has_many   :answers,  dependent: :destroy
  validates :choices, presence: true, length:  { maximum: 20 }, uniqueness: { scope: :word }
end
