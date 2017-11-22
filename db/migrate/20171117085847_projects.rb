class Projects < ActiveRecord::Migration[5.1]
  def change
  	create_table :projects do |t|
  		t.string :project_title
  		t.string :project_description
  		t.string :location
  		t.integer :fund_goal
  		t.integer :current_fund

  		t.timestamps
  	end
  end
end
