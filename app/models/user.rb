class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses, as: :addressable
  has_many :petitions
  has_one_attached :photo
  def profile_picture
    if photo.attached?
      photo.key
    else
      "https://kitt.lewagon.com/placeholder/users/ssaunier"
    end
  end
  
end
