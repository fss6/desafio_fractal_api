MAX = 15
# User seed collection
(1..MAX).collect{{
  name: Faker::Name.unique.name,
  email: Faker::Internet.unique.email,
  password: '12345678'
}}.each do |user_attribute|
  user = User.new(user_attribute)
  user.save if user.valid?
end

# Category seed collection
(1..MAX).collect{ |index| {
  user_id: index,
  name: Faker::Lorem.unique.word
}}.each do |category_attribute|
  category = Category.new(category_attribute)
  category.save if category.valid?
end

# Project seed collection
(1..MAX).collect{ |index| {
  user_id: index,
  category_id: Category.first.id,
  name: Faker::Lorem.word,
  description: Faker::Lorem.paragraph
}}.each do |project_attribute|
  project = Project.new(project_attribute)
  project.save if project.valid?
end

# Task seed collection
(1..MAX).collect{ |index| {
  project_id: index,
  name: Faker::Lorem.word,
  description: Faker::Lorem.paragraph
}}.each do |task_attribute|
  task = Task.new(task_attribute)
  task.save if task.valid?
end
