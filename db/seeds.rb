# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.new
company.name = 'Test'
company.website = 'test.com'
company.address = 'Raleigh'
company.size = 2000
company.year = 1990
company.revenue = 200000
company.synopsis = 'Test'

house_hunter = HouseHunter.new
house_hunter.email = 'admin@gmail.com'
house_hunter.name = 'Admin'
house_hunter.password = 'abc123'
house_hunter.password_confirmation = 'abc123'
house_hunter.phone = 9845785125
house_hunter.preferred = 'email'
house_hunter.save!

realtor = Realtor.new
realtor.email = 'admin@gmail.com'
realtor.name = 'Admin'
realtor.password = 'abc123'
realtor.password_confirmation = 'abc123'
realtor.phone = 9845782563
realtor.company_id = 1