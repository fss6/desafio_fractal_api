FactoryBot.define do
  factory :category do
    user nil
    name Faker::Lorem.unique.word
  end
end
