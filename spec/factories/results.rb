FactoryBot.define do
  factory :result do
    title { "Sample Title" }
    association :diagnosis
  end
end