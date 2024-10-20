# frozen_string_literal: true

# This class represents a result associated with a diagnosis.
class Result < ApplicationRecord
  validates :title, presence: true

  belongs_to :diagnosis
  has_many :videos
end
