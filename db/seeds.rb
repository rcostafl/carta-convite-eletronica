# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
puts "creating fake government users"
3.times do |index|


    user = User.create!(
        email: "gov#{index + 1}@gmail.com",
        name: Faker::Name.name,
        password: 123456,
        government: true,
        address: Faker::Address.full_address,
        ni: rand(10000000000000..99999999999999)
    )


  3.times do
    title = ["Material de escritório", "Serviço de encanador", "Novas viaturas", "Copiadoras" , "Refrigeradores", "Armários e Mesas", "Uniforme operacional", "Persianas", "Catracas", "Gêneros alimentícios"].sample
    Need.create!(
        title: title,
        description: Faker::Lorem.sentence,
        address: Faker::Address.full_address,
        deadline: Time.now + rand(1..5).days,
        user_id: user.id
    )
  end


end

puts "creating fake interested users"
10.times do |index|


    user = User.create!(
        email: "user#{index + 1}@gmail.com",
        name: Faker::Name.name,
        password: 123456,
        government: false,
        address: Faker::Address.full_address,
        ni: rand(10000000000..99999999999)
    )


    4.times do
      Proposal.create!(
        description: Faker::Lorem.sentence,
        value: rand(2000..8000),
        user: user,
        need: Need.all.shuffle.sample
      )
    end


end


