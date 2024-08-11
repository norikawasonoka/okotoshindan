class Question < ApplicationRecord
  validates :question_title, presence: true
end
