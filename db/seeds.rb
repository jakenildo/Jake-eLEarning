# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name: "Jake Nildo Giangan",
            email: "jake@email.com",
            password: "password",
            password_confirmation: "password",
            account_type: 1)

50.times do |n|
    name = Faker::Games::Pokemon.name
    email = "username#{n+1}@email.com"
    password = "password"
    account_type = 0

    User.create!(name: name,
        email: email,
        password: password,
        password_confirmation: password,
        account_type: 0)
end

20.times do |n|
    title = Faker::Game.title
    desc = Faker::Game.genre

    Category.create!(title: title, 
                     description: desc)
end

cats = Category.order(:created_at).take(3)

5.times do
    word = Faker::Esport.team
    choice1 = Faker::Esport.player
    choice2 = Faker::Esport.player
    choice3 = Faker::Esport.player
    ct = 1
    nc = 0
    cats.each { |wrd| wrd.words.create!(
        words:word,
        :choices_attributes => 
        {
            0 =>{
                choices: choice1,
                correct_ans: ct
            },

            1 =>{
                choices: choice2,
                correct_ans: nc
            },

            2 =>{
                choices: choice3,
                correct_ans: nc
            }
        }
        
        ) }
    
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }