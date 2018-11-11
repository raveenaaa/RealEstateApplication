# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.new
admin.email = 'admin@gmail.com'
admin.name = 'admin'
admin.password = 'abc123'
admin.password_confirmation = 'abc123'
admin.save!

realtor = Realtor.new
realtor.email = 'ravz@gmail.com'
realtor.name = 'Raveena'
realtor.password = 'abc123'
realtor.password_confirmation = 'abc123'
realtor.phone = 9845785125
realtor.save!

house_hunter = HouseHunter.new
house_hunter.email = 'ravz@gmail.com'
house_hunter.name = 'Raveena'
house_hunter.password = 'abc123'
house_hunter.password_confirmation = 'abc123'
house_hunter.phone = 9845785125
house_hunter.preferred = 'email'
realtor.save!