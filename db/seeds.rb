# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Delete all users"
User.delete_all
puts "Create the admin user"
admin = User.new(email: "admin@example.com", password: 12345678, password_confirmation: 12345678)
admin.skip_confirmation!
admin.add_role :admin
admin.save
puts "Create manager"
manager = User.new(email: "manager@example.com", password: 12345678, password_confirmation: 12345678)
manager.skip_confirmation!
manager.add_role :manager
manager.save
puts "Create default User"
user = User.new(email: "user@example.com", password: 12345678, password_confirmation: 12345678)
user.skip_confirmation!
user.add_role :customer
user.save