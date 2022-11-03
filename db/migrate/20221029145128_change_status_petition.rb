class ChangeStatusPetition < ActiveRecord::Migration[7.0]
  def change
    remove_column :petitions, :status, :string
    add_column :petitions, :status, :integer, default: 0
  end
end
