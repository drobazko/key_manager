# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!(title: 'Social')
Category.create!(title: 'Bussiness')
Category.create!(title: 'Payment Systems')
Category.create!(title: 'Games/Entertainment')
Category.create!(title: 'Mail')
Category.create!(title: 'Miscellaneous')


# my user
user = User.create!(
  email: 'drobazko@gmail.com', 
  password: '12345678', 
  password_confirmation: '12345678', 
)

# arbitrary user
User.create!(
  email: 'user@keymng.com', 
  password: '12345678', 
  password_confirmation: '12345678', 
)

