class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at
  link(:show) { category_url(object) }
  belongs_to :user
end