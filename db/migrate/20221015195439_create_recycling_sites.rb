class CreateRecyclingSites < ActiveRecord::Migration[7.0]
  def change
    create_table :recycling_sites do |t|
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
