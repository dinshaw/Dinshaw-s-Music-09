require 'machinist/active_record'
require 'sham'

User.blueprint do
  email { Sham.email }
  password 'password' 
  password_confirmation 'password'
end

Sham.define do
  title { Faker::Lorem.words(5).join(' ') }
  name  { Faker::Name.name }
  body  { Faker::Lorem.paragraphs(3).join("\n\n") }
  email { Faker::Internet.email }
end