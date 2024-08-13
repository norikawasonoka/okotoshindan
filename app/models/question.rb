class Question < ApplicationRecord
  validates :title, presence: true

  has_many :question_points, dependent: :destroy
end
