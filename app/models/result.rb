class Result < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_and_belongs_to_many :questions
end
