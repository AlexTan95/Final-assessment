# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = 'asdf'
user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

project = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  20.times do 
    project['project_title'] = Faker::App.name
    project['project_description'] = Faker::Hipster.sentence
    project['current_fund'] = rand(100..300)
    project['fund_goal'] = rand(600..1000)
    project['location'] = Faker::Address.country

    project['user_id'] = uids.sample
    
    Project.create(project)
  end
end

