FactoryBot.define do
  factory :project do
    user nil
    category nil
    name Faker::Lorem.unique.word
    description Faker::Lorem.paragraph
  end
end
