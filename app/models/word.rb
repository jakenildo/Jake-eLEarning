class Word < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true

  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, reject_if: lambda { |a| a[:choices].blank? }, allow_destroy: true

  validate :choices_form

  def choices_form
    counter = choices.select{ |col| col.correct_ans }.length
    if counter != 1
      return errors.add(:base)
    end
  end
end