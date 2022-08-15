class Movie < ApplicationRecord
  has_many :reviews,dependent: :destroy
  has_many :movie_genres, dependent: :destroy
 
end
