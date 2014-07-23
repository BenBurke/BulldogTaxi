class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :promo_code, :string
  	add_column :users, :parent_id, :integer
  	add_index :users, :parent_id
  	add_column :users, :tokens, :integer, default: 0
  end
end
