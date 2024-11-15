# frozen_string_literal: true

# Video model for storing video information
class Video < ApplicationRecord
  # YoutubeVideoがActiveHash::BaseのためApplicationRecordがないとつながらないためyoutubeとつなげるvideoを作成
  belongs_to :result
  has_many :users, through: :favorites
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :embed_code, presence:
end
