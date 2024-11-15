# frozen_string_literal: true

# User model for application users
class User < ApplicationRecord
  validates :line_user_id, presence: true, uniqueness: true

  has_many :favorites, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :favorited_videos, through: :favorites, source: :video

  def favorited_videos
    favorites.includes(:video).map(&:video) # favoritesを通じて関連するVideoを取得
  end

  def already_favorited?(video)
    favorites.exists?(video_id: video.id)
  end
end
