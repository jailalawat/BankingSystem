# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Delete all bank"
Bank.delete_all
puts "Create a Bank"
bank = Bank.create(name: "ICICI Bank")

puts "Delete all users"
User.delete_all
puts "Create the admin user"
admin = User.new(email: "admin@example.com", password: 12345678, password_confirmation: 12345678)
admin.skip_confirmation!
admin.add_role :admin
puts "create admin profile"
admin.build_profile(first_name: "Admin", last_name: "User", middle_name: "", mobile_no: 9874563210)
admin.save

puts "Create manager"
manager = User.new(email: "manager@example.com", password: 12345678, password_confirmation: 12345678)
manager.skip_confirmation!
manager.add_role :manager
puts "create manager profile"
manager.build_profile(first_name: "manager", last_name: "Soni", middle_name: "", mobile_no: 9884563210)
manager.build_beneficiary(name: "Anil Soni", relation: Beneficiary.relations['father'])
manager.addresses.build(house_number: "88", floor_no: "10", building_name: "Model", street_no: "Freeganj", landmark: "Sanwer Road", area: "Ujjain", state: "MP", city: "Ujjain", pin_code: 456010, permanent: true)
manager.build_account(bank_id: bank.id, balance: 5000)
manager.save

puts "Create default User"
user = User.new(email: "user@example.com", password: 12345678, password_confirmation: 12345678)
user.skip_confirmation!
user.add_role :customer
puts "create user profile"
user.build_profile(first_name: "Sanjay", last_name: "Sen", middle_name: "", mobile_no: 9774563210)
user.build_beneficiary(name: "Ajit Sen", relation: Beneficiary.relations['father'])
user.addresses.build(house_number: "37 A", floor_no: "1", building_name: "Silver", street_no: "Indore", landmark: "Sanwer Road", area: "Ujjain", state: "MP", city: "Ujjain", pin_code: 456010, permanent: true).save
user.build_account(bank_id: bank.id, balance: 2000)
user.save