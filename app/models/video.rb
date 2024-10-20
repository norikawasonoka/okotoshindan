class Video < ApplicationRecord
  #YoutubeVideoがActiveHash::BaseのためApplicationRecordがないとつながらない
  belongs_to :result
  has_many :users, through: :favorites
  has_many :favorites, dependent: :destroy

  #def youtube_video
    #YoutubeVideo.find_by(id: self.youtube_video_id)
  #end
end
