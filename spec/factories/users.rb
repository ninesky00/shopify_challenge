FactoryBot.define do 
  factory :user, class: User do 
    username { Faker::Kpop.girl_groups }
    email { Faker::Internet.email }
    password { Faker::House.furniture }
  end
end