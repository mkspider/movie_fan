class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :review_favorites, dependent: :destroy


#  def create_with_score
# =>  コントローラーの処理をここに持ってきてseedから呼べるようにする。
#  end

end
