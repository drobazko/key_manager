class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
    	t.string :title
    	t.string :href, null: false

		t.timestamps
    end
  end
end
