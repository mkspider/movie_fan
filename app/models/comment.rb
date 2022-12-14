class Comment < ApplicationRecord
  belongs_to :movie,optional: true
  belongs_to :review
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :likes, source: :user
end
