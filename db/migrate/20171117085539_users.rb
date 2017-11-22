class Users < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |x|
			x.string :email
			x.string :password_digest
			x.string :first_name
			x.string :last_name
			x.integer :access_level, default: 0

			x.timestamps
	end
  end
end
