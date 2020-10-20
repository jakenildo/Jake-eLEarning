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

4.times do
    word = Faker::Esport.team
    cats.each { |wrd| wrd.words.create!(words:word) }
end

choices = Word.order(:created_at).take(12)

choice = Faker::Esport.player
correct = 1
choices.each { |ch| ch.choices.create!(choices:choice, correct_ans: correct) }

choice = Faker::Esport.player
correct = 0
choices.each { |ch| ch.choices.create!(choices:choice, correct_ans: correct) }

choice = Faker::Esport.player
correct = 0
choices.each { |ch| ch.choices.create!(choices:choice, correct_ans: correct) }
