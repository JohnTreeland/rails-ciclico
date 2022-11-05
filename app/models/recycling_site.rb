class RecyclingSite < ApplicationRecord
  belongs_to :material
  belongs_to :collector, class_name: "User"
  has_many :petitions
  has_one :address, as: :addressable

  has_one_attached :photo
  def site_picture
    if photo.attached?
      photo.key
    else
      "https://www.wiego.org/sites/default/files/Hewlett_Bogota_FullRelease_050_1.jpg"
    end
  end

end
