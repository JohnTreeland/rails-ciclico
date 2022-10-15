class AddCollectorToRecyclingSite < ActiveRecord::Migration[7.0]
  def change
    add_reference :recycling_sites, :collector, foreign_key: { to_table: :users }, index: true
  end
end
