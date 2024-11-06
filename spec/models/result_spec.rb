# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'バリデーション' do
    it 'titleが存在する場合、有効であること' do
      diagnosis = FactoryBot.create(:diagnosis) # Diagnosisのファクトリを使って診断を作成
      result = Result.new(title: 'Valid Title', diagnosis:)
      expect(result).to be_valid
    end

    it 'titleが存在しない場合、無効であること' do
      result = Result.new(title: nil)
      expect(result).to_not be_valid
      expect(result.errors[:title]).to include("can't be blank")
    end
  end

  describe '関連付け' do
    it 'diagnosisとの関連があること' do
      association = Result.reflect_on_association(:diagnosis)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many videos' do
      expect(Result.reflect_on_association(:videos).macro).to eq(:has_many)
    end

    it 'has many favorites' do
      expect(Result.reflect_on_association(:favorites).macro).to eq(:has_many)
    end
  end
end
