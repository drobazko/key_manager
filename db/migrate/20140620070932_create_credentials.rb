class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
    	t.string :login
    	t.string :password
    	t.string :name, null: false
    	t.string :link
		t.text :comment
    	t.string :encrypted_password
    	t.string :encrypted_login
        t.datetime :expiration_date

		t.timestamps
    end
  end
end
