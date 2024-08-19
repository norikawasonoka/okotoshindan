class Result < ApplicationRecord
  validates :title, presence: true
  
  belongs_to :diagnosis
end
