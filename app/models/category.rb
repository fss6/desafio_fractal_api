class Category < ApplicationRecord
  belongs_to :user
  has_many :projects, dependent: :restrict_with_error

  validates :name, :user, presence: true
  validates :name, uniqueness: true
end
