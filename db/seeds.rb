# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# YoutubeVideoがActiveHashを使用しているため、ActiveRecordとは異なる方法で処理する
user = User.first # 必要に応じて適切なユーザーを取得
results = Result.all # 全ての結果を取得

# YoutubeVideoデータを元にVideoレコードをデータベースに作成
# YoutubeVideoがActiveHashを使用しているためseedを使用して取得
YoutubeVideo.all.each do |youtube_video|
  result = Result.find_by(id: youtube_video.result_id)
  next unless result

  Video.create!(
    title: youtube_video.title,
    embed_code: youtube_video.embed_code,
    youtube_video_id: youtube_video.id,
    result_id: youtube_video.result_id
  )
end

  Video.create!(
  id: 1, 
  title: "六段の調", 
  embed_code: '<iframe src=\"https://www.youtube.com/embed/WiMo8F6rKA8\"\n      title=\"頭上からの視点で『六段の調』iPh
              oneXSでの撮影\"\n      allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web
              -share\"\n      referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen class=\"youtube mx-auto\">\n      </ifram
              e>', 
  youtube_video_id: 1, 
  result_id: 1
)
