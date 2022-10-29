class AddLatitudeLongitudandAdressToAdress < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :address, :string
    rename_column :addresses, :long, :longitude
    rename_column :addresses, :lat, :latitude
  end
end
