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
        t.date :expiration_date
        t.integer :is_notified, default: 0

    t.timestamps
    end
  end
end
