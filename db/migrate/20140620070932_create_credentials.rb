class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
    	t.string :login, null: false
    	t.string :pass, null: false
    	t.string :name, null: false
    	t.text :comment, null: false

		t.timestamps
    end
  end
end
