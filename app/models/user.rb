class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews
  has_many :comments
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

def get_profile_image
  if profile_image.attached?

  else
    'no_image.jpg'
  end
end

end
