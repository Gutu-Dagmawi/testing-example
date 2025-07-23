FactoryBot.define do
  factory :article do
    title { Faker::String.unique }
    body { Faker::Lorem.paragraph(sentence_count: 5) }

    association :author, factory: :user
  end
end
