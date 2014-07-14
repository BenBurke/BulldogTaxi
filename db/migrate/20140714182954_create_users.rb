class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.integer :phone_number
    	t.string :net_id
    	t.string :college
    	t.integer :year
    	# remember token 
    	

      t.timestamps
    end
  end
end
