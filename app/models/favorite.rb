# frozen_string_literal: true

# Favorite model for storing user favorites
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :video
  belongs_to :result

  # ユーザー一人につきいいね1個まで
  validates_uniqueness_of :video_id, scope: :user_id
end
