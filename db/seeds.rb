# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
puts "creating fake government users"
3.times do


    user = User.create!(
        email: Faker::Internet.email,
        name: Faker::Name.name,
        password: 123456,
        government: true,
        address: Faker::Address.full_address,
        ni: rand(10000000000000..99999999999999)
    )

    
        
  Need.create!(
      title: ["Material de escritório", "Serviço de encanador"].sample,
      description: Faker::Lorem.sentence,
      address: Faker::Address.full_address,
      deadline: Time.now + rand(1..5).days,
      user_id: user.id
  )
end

puts "creating fake interested users"
10.times do


    user = User.create!(
        email: Faker::Internet.email,
        name: Faker::Name.name,
        password: 123456,
        government: false,
        address: Faker::Address.full_address,
        ni: rand(10000000000..99999999999)
    )

    

      Proposal.create!(
        description: Faker::Lorem.sentence,
        value: rand(2000..8000),
        user: user,
        need: Need.take
      )

end


