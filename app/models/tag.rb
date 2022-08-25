class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :movies, through: :tagmaps
end
