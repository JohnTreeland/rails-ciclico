class RecyclingSite < ApplicationRecord
  belongs_to :material
  belongs_to :collector, class_name: "User"
  has_one :address, as: :addressable
end
