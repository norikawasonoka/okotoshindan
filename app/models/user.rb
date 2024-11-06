# frozen_string_literal: true

class User < ApplicationRecord
  validates :line_user_id, presence: true, uniqueness: true

  has_many :favorites, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :favorited_videos, through: :favorites, source: :video

  def favorited_videos
    self.favorites.includes(:video).map(&:video) # favoritesを通じて関連するVideoを取得
  end

  def already_favorited?(video)
    self.favorites.exists?(video_id: video.id)
  end
end
