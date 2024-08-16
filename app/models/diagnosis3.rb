class Diagnosis2 < ApplicationRecord
  validates :title, presence: true

  belongs_to :diagnosis
end
