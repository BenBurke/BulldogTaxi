class AddTimeDateTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :arrival_date, :string
  	add_column :trips, :arrival_time, :string
  end
end
