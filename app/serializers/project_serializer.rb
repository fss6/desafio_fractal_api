class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :updated_at
  link(:show) { project_url(object) }

  belongs_to :category do
    { id: object.category.id, name: object.category.name }
  end

  has_many :tasks do
    object.tasks.collect { |task| { id: task.id, name: task.name } }
  end
end