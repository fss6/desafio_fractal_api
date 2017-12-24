FactoryBot.define do
  factory :project do
    name 'MyName'
    description 'MyDescription'
  end

  sequence :name do |n|
    "MyName#{n}"
  end
end
