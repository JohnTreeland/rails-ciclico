class AddDescriptionToRecyclingSite < ActiveRecord::Migration[7.0]
  def change
    add_column :recycling_sites, :description, :text
  end
end
