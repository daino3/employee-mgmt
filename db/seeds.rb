# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
dates = (3.years.ago.to_date..Date.today).to_a

5.times do |n|
  Employee.create!(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    hire_date: dates.sample
  )
end
