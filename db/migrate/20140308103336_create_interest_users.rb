class CreateInterestUsers < ActiveRecord::Migration
  def change
    create_table :interest_users do |t|
      t.text :name

      t.timestamps
    end
  end
end
