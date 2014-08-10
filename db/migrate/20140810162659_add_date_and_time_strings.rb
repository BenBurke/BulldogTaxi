class AddDateAndTimeStrings < ActiveRecord::Migration
  def change
  	add_column :flights, :arrival_date, :string
  	add_column :flights, :arrival_time, :string
  end
end
