class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :review
  belongs_to :user
end
