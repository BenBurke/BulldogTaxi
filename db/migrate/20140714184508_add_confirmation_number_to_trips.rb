class AddConfirmationNumberToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :confirmation, :string
  end
end
