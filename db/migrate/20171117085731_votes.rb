class Votes < ActiveRecord::Migration[5.1]
  def change
  	create_table :votes do |t|
  		t.integer :donation_amount
  		t.integer :user_id
  		t.integer :project_id

  		t.timestamps
  	end
  end
end
