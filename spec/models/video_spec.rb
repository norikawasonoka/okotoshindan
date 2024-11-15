# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'validations' do
    let(:diagnosis) { Diagnosis.create!(title: 'Sample Diagnosis') }
    let(:result) { Result.create!(title: 'Sample Title', diagnosis_id: diagnosis.id) }
    let(:youtube_video) { YoutubeVideo.create!(title: 'Sample YouTube Video') }
    let(:video) { Video.new(title: 'Sample Video', embed_code: '<iframe></iframe>', result:) }

    it 'is valid with a title and embed_code' do
      expect(video).to be_valid
    end

    it 'is invalid without an embed_code' do
      video.embed_code = nil # embed_codeをnilに設定
      expect(video).not_to be_valid
    end

    it 'is invalid without a title' do
      video.title = nil # titleをnilに設定
      expect(video).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a result' do
      expect(Video.reflect_on_association(:result).macro).to eq(:belongs_to)
    end

    it 'has many users through favorites' do
      expect(Video.reflect_on_association(:users).macro).to eq(:has_many)
    end

    it 'has many favorites' do
      expect(Video.reflect_on_association(:favorites).macro).to eq(:has_many)
    end
  end
end
