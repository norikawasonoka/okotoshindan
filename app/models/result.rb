class Result < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :score_range_start, presence: true, numericality: { only_integer: true }
  validates :score_range_end, presence: true, numericality: { only_integer: true }

  belongs_to :question
end
