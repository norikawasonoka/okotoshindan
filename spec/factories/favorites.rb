# frozen_string_literal: true

FactoryBot.define do
  factory :favorite do
    association :user
    association :video
    association :result  # Resultの関連付けも行う
    youtube_video_id { "dummy_youtube_video_id" } # ダミーのyoutube_video_idを設定
  end
end