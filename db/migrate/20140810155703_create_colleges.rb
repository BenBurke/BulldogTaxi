class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
    	t.string :name

      t.timestamps
    end
    add_column :users, :college_id, :integer
  end
end
