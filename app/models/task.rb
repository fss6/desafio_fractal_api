class Task < ApplicationRecord
  belongs_to :project

  validates :name, :project, presence: true
  validates :name, uniqueness: true
end
