class AddCategoryRefToCredentials < ActiveRecord::Migration
  def change
  	add_reference :credentials, :category, index: true 
  end
end
