class Favorite < ApplicationRecord
  validates_uniqueness_of :review_id,:comment_id, scope: :user_id
  belongs_to :user
  belongs_to :review
  belongs_to :comment
end
