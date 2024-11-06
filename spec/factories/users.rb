# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    line_user_id { '12345' }
    name { 'Test User' }
  end
end
