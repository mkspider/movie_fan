class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :favorited_reviews, through: :likes, source: :post
  has_many :favorited_comments, through: :likes, source: :post
  has_one_attached :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def review_average
    if reviews.any?
       reviews.average(:score)*10
    else
       ""
    end
  end
  
  def liked_by?(review_id)#commentを追加するにはどうするか？
      likes.where(review_id: review_id).exists?
  end
  
  def get_profile_image
    if profile_image.attached?
  
    else
      'no_image.jpg'
    end
  end
  
end
