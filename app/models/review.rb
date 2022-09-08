class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :likes, source: :user

#  def create_with_score
# =>  コントローラーの処理をここに持ってきてseedから呼べるようにする。
#  end

end
