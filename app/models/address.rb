class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
