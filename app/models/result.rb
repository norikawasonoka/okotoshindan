class Result < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :question_points, dependent: :destroy
end
