# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
user = User.new
user.first_name = "Hoppers"
user.last_name = "Admin"
user.is_admin = true
user.email = 'admin@techhoppers.com'
user.password = 'Way4admin*'
user.password_confirmation = 'Way4admin*'
user.save!
