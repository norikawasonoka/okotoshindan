class Diagnosis < ApplicationRecord
  validates :title, presence: true

  has_many :results
end
