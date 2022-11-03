class ChangeInputTypeToDateTimeInPetition < ActiveRecord::Migration[7.0]
  def change
    change_column :petitions, :date, :datetime
  end
end
