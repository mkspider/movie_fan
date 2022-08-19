class Genre < ApplicationRecord
  has_many :movies
  validates :genre_name, presence: true
end
