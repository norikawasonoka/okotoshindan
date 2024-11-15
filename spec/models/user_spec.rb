# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:video) { create(:video) }
  let(:favorite) { create(:favorite, user:, video:) }

  describe 'validations' do
    it 'is valid with a unique line_user_id' do
      expect(user).to be_valid
    end

    it 'is invalid without a line_user_id' do
      user.line_user_id = nil
      expect(user).not_to be_valid
    end

    it 'is invalid with a duplicate line_user_id' do
      another_user = build(:user, line_user_id: user.line_user_id)
      expect(another_user).not_to be_valid
    end
  end

  describe '#favorited_videos' do
    it 'returns videos favorited by the user' do
      favorite
      expect(user.favorited_videos).to include(video)
    end
  end

  describe '#already_favorited?' do
    it 'returns true if the user already favorited the video' do
      favorite
      expect(user.already_favorited?(video)).to be true
    end

    it 'returns false if the user has not favorited the video' do
      expect(user.already_favorited?(video)).to be false
    end
  end
end
