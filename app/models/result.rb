# frozen_string_literal: true

# This class represents a result associated with a diagnosis.
class Result < ApplicationRecord
  validates :title, presence: true

  belongs_to :diagnosis
  has_many :videos
  #has_many :youtube_videos
  #has_many :favorites
  #has_many :favoriting_users, through: :favorites, source: :user
end
