
# User seed collection
(1..5).collect{{
  name: Faker::Name.unique.name,
  email: Faker::Internet.unique.email,
  password: Faker::Internet.password(min_length = 8, max_length = 8)
}}.each do |user_attribute|
  user = User.new(user_attribute)
  user.save if user.valid?
end

# Category seed collection
(1..5).collect{{
  user_id: User.first.id,
  name: Faker::Lorem.unique.word
}}.each do |category_attribute|
  category = Category.new(category_attribute)
  category.save if category.valid?
end

# Project seed collection
(1..5).collect{{
  user_id: User.first.id,
  category_id: Category.first.id,
  name: Faker::Lorem.word,
  description: Faker::Lorem.paragraph
}}.each do |project_attribute|
  project = Project.new(project_attribute)
  project.save if project.valid?
end

# Task seed collection
(1..5).collect{{
  project_id: Project.first.id,
  name: Faker::Lorem.word,
  description: Faker::Lorem.paragraph
}}.each do |task_attribute|
  task = Task.new(task_attribute)
  task.save if task.valid?
end
