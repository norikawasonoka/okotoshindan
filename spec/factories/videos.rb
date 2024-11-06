# frozen_string_literal: true

FactoryBot.define do
  factory :video do
    title { "Sample Video" }
    embed_code { "<iframe></iframe>" }
    association :result  # resultの関連付けを行う
    youtube_video_id { 1 }
    video_id { 1 }
  end
end
