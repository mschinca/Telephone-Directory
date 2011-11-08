# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Entry.count == 0
  Entry.create([
    {:first_name => "Marco", :last_name => "Schincaglia", :phone_number => "+39 12 123654"},
    {:first_name => "Carlo", :last_name => "Rossi", :phone_number => "+1 34 654321"},
    {:first_name => "Mario", :last_name => "Bianchi", :phone_number => "+39 56 789654"},
  ])
end
