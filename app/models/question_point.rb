class QuestionPoint < ApplicationRecord
  validates :answer, inclusion: [true, false]
  validates :point, presence: true

  belongs_to :question
  belongs_to :result
end
