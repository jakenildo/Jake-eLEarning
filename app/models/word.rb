class Word < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true

  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, reject_if: lambda { |a| a[:choices].blank? }, allow_destroy: true
end
