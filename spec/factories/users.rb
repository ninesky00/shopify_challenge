FactoryBot.define do 
  factory :user, class: User do 
    username { Faker::Kpop.unique.girl_groups }
    email { Faker::Internet.unique.email }
    password { Faker::House.furniture }
  end
end