class Project < ApplicationRecord
  searchkick word_middle: [:name, :description, :user_id]
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :users
  has_many :tasks

  validates :name, presence: true
  validates :name, uniqueness: true

  def search_data
    {
      name: name,
      description: name,
      user_id: user.id,
      category_name: category.name
    }
  end
end
