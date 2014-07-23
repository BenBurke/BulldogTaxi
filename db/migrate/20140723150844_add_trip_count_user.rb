class AddTripCountUser < ActiveRecord::Migration
  def change
  	add_column :users, :trip_count, :integer, default: 0
  end
end
