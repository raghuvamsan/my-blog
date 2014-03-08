class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :phone, :integer
  	add_column :users, :dob, :date
  	add_column :users, :facebook, :string
  	add_column :users, :twitter, :string  	
  end
end
