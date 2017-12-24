FactoryBot.define do
  factory :task do
    project nil
    name Faker::Lorem.unique.word
    description Faker::Lorem.paragraph
  end
end
