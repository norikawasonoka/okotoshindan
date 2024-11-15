# frozen_string_literal: true

FactoryBot.define do
  factory :favorite do
    association :user
    association :video
    association :result # Resultの関連付けも行う
  end
end
