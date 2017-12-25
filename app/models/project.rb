class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :users
  has_many :tasks

  validates :name, :user, :category, presence: true
  validates :name, uniqueness: true
end
