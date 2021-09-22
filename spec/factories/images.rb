FactoryBot.define do 
  factory :image, class: Image do 
    title { Faker::Fantasy::Tolkien.character }
    owner { create(:user).username }
    text { Faker::Quote.unique.famous_last_words }
    description { Faker::ProgrammingLanguage.unique.name }
    after(:build) do |model|
      model.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'sample.png')), filename: 'sample.png', content_type: 'image/png')
    end
  end
end

