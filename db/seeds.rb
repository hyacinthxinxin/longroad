# frozen_string_literal: true
# This file should contain all the record creation needed to
# seed the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#

User.create!(name: 'fanxin', email: 'fanxin0202@163.com',
             password: 'aini1234', password_confirmation: 'aini1234',
             admin: true)

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@163.com"
  password = 'password'
  User.create!(name: name, email: email,
               password: password, password_confirmation: password,
               admin: false)

end
