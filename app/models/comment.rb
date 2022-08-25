class Comment < ApplicationRecord
  belongs_to :movie,optional: true
  belongs_to :review
  belongs_to :user
end
