FactoryBot.define do 
  factory :image, class: Image do 
    title { Faker::Fantasy::Tolkien.character }
    owner factory: :user
    text { Faker::Quote.famous_last_words }
    description { Faker::ProgrammingLanguage.name }
    characteristic { Faker::Measurement.metric_height }
  end
end