class ReviewFavorite < ApplicationRecord
  validates_uniqueness_of :review_id, scope: :user_id
  belongs_to :user
  belongs_to :review
end
