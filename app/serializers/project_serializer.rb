class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :updated_at
  link(:show) { project_url(object) }

  belongs_to :user
  belongs_to :category
  has_many :tasks
end