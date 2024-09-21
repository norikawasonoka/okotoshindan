require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  describe 'バリデーション' do
    it 'titleが存在する場合、有効であること' do
      diagnosis = Diagnosis.new(title: "Valid Title")
      expect(diagnosis).to be_valid
    end

    it 'titleが存在しない場合、無効であること' do
      diagnosis = Diagnosis.new(title: nil)
      expect(diagnosis).to_not be_valid
      expect(diagnosis.errors[:title]).to include("can't be blank")
    end
  end

  describe '関連付け' do
    it 'resultsとの関連があること' do
      association = Diagnosis.reflect_on_association(:results)
      expect(association.macro).to eq :has_many
    end
  end
end
