# frozen_string_literal: true

# This class represents a diagnosis in the application.
class Diagnosis < ApplicationRecord
  validates :title, presence: true

  has_many :results
end
