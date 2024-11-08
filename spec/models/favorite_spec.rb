# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    let(:user) { create(:user) }
    let(:video) { create(:video) }
    let(:result) { create(:result) }  # resultを追加
    let(:favorite) { create(:favorite, user: user, video: video, youtube_video_id: "test_youtube_id") }


    it 'is valid with a user, a video, and a result' do
      favorite = Favorite.new(user: user, video: video, result: result)  # resultを設定
      expect(favorite).to be_valid
    end

    it 'is invalid without a user' do
      favorite = Favorite.new(user: nil, video: video, result: result)
      expect(favorite).not_to be_valid
    end

    it 'is invalid without a video' do
      favorite = Favorite.new(user: user, video: nil, result: result)
      expect(favorite).not_to be_valid
    end

    it 'is invalid without a result' do  # resultがない場合のテストを追加
      favorite = Favorite.new(user: user, video: video, result: nil)
      expect(favorite).not_to be_valid
    end

    it 'validates uniqueness of video_id scoped to user_id' do
      Favorite.create(user: user, video: video, result: result)  # resultを設定
      duplicate_favorite = Favorite.new(user: user, video: video, result: result)
      expect(duplicate_favorite).not_to be_valid
    end
  end
end
