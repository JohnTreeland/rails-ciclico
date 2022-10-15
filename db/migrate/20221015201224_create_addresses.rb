class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.float :long
      t.float :lat
      t.references :addressable, polymorphic: true
      t.timestamps
    end
  end
end
