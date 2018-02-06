# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  departments = Department.create([{ name: 'Potluck Society' }, { name: 'Potluck Catering Inc.' }])
  user = User.create! :first_name => 'Joseph', :last_name => 'Masongsong', :email => 'joseph@potluckcatering.com', :password => 'password', :password_confirmation => 'password', admin: true
  user2 = User.create! :first_name => 'Trish', :last_name => 'Kelly', :email => 'trish@potluckcatering.com', :password => 'password', :password_confirmation => 'password', admin: true



