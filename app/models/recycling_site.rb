class RecyclingSite < ApplicationRecord
  belongs_to :material
  belongs_to :collector, class_name: "User"
  has_many :addresses, as: :addressable
end
