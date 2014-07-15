class AddDropColumnsUser < ActiveRecord::Migration
  def change
  	remove_column :users, :net_id
  end
end
