# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :video

 #ユーザー一人につきいいね1個まで
  validates_uniqueness_of :video_id, scope: :user_id
end
