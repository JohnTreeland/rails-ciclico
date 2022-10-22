class AddNameToRecyclingSites < ActiveRecord::Migration[7.0]
  def change
    add_column :recycling_sites, :name, :string
  end
end
