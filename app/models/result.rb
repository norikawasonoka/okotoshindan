class Result < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :question
end
