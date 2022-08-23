class Movie < ApplicationRecord
  has_one_attached :image
  has_many :reviews,dependent: :destroy
  belongs_to :genre

def self.search(search_word)
    Book.where(['category LIKE ?', "#{search_word}"])
end

end
