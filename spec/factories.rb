require 'faker'

Factory.define :entry do |f|
  f.first_name {Faker::Name.first_name}
  f.last_name {Faker::Name.last_name}
  f.phone_number {Faker::PhoneNumber.numerify("+## ### ######")}
end
