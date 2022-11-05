class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :collector, class_name: "User", optional: true
  belongs_to :recycling_site, optional: true
  belongs_to :material
  enum status: %i[pendiente aceptado rechazado]
  has_one :address, as: :addressable
end
