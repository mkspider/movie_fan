class Movie < ApplicationRecord
  has_one_attached :film_image
  has_many :reviews,dependent: :destroy

end
