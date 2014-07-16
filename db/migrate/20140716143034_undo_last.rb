class UndoLast < ActiveRecord::Migration
  def change
  	add_column :trips, :flight_number, :string
  end
end
