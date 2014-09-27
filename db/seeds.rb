# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
  Agency.create(location: "Location ##{i}")
end

3.times do |i|
	User.create(username: "user#{i}", role: i, email: "user#{i}@a.com", password: "12345678", agency_id: Agency.first.id)
end