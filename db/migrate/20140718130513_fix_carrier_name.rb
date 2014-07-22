class FixCarrierName < ActiveRecord::Migration
  def change
  	rename_column :flights, :carrier, :carrier_name
  	
  end
end
