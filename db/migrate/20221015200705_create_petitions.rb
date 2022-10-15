class CreatePetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :petitions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
