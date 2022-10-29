class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :collector, class_name: "User"
  belongs_to :material
  has_many :addresses, as: :addressable
end
