class AddCarrierNameFlight < ActiveRecord::Migration
  def change
  	add_column :flights, :carrier, :string
  end
end
