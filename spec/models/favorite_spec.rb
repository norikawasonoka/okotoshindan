# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    let(:user) { create(:user) }
    let(:video) { create(:video) }
    let(:result) { create(:result) } # resultを追加
    let(:favorite) { Favorite.new(user:, video:, result:) }

    it 'is valid with a user, a video, and a result' do
      favorite = Favorite.new(user:, video:, result:) # resultを設定
      expect(favorite).to be_valid
    end

    it 'is invalid without a user' do
      favorite = Favorite.new(user: nil, video:, result:)
      expect(favorite).not_to be_valid
    end

    it 'is invalid without a video' do
      favorite = Favorite.new(user:, video: nil, result:)
      expect(favorite).not_to be_valid
    end

    it 'is invalid without a result' do # resultがない場合のテストを追加
      favorite = Favorite.new(user:, video:, result: nil)
      expect(favorite).not_to be_valid
    end

    it 'validates uniqueness of video_id scoped to user_id' do
      Favorite.create(user:, video:, result:) # resultを設定
      duplicate_favorite = Favorite.new(user:, video:, result:)
      expect(duplicate_favorite).not_to be_valid
    end
  end
end
