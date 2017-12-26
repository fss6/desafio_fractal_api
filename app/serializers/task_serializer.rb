class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :done, :created_at, :updated_at
  link(:show) { task_url(object) }

  belongs_to :project do
    { id: object.project.id, name: object.project.name }
  end


end