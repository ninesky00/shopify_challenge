FactoryBot.define do 
  factory :image, class: Image do 
    title { Faker::Fantasy::Tolkien.character }
    owner { create(:user).username }
    text { Faker::Quote.unique.famous_last_words }
    description { Faker::ProgrammingLanguage.unique.name }
    characteristic { Faker::Measurement.unique.metric_height }
  end
end

