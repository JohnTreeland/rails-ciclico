class AddRecyclingSiteToPetitions < ActiveRecord::Migration[7.0]
  def change
    add_reference :petitions, :recycling_site, foreign_key: true
  end
end
