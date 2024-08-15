class Question < ApplicationRecord
  has_many :results, dependent: :destroy
  validates :title, presence: true
  
  attribute :question_type, :integer
  enum question_type: { kotono: 0, pops: 1 }

  SCORES = {
    kotono: {
      '定番' => 10,
      '定番のアレンジ' => 20,
      'オリジナル' => 30,
      'この音とまれ' => 40,
      '激しい曲' => 50,
      'きれいな曲' => 60
    },
    pops: {
      'アップテンポ' => 70,
      'スローテンポ' => 80
    }
  }

  def scores_for_role
    SCORES[question_type.to_sym]
  end
end
