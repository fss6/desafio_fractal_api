class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :projects
  has_many :projects
  has_many :categories

  def search(term)
    term = term.present? ? term.downcase : term
    term = "%#{term}%"
    projects.where("lower(projects.name) LIKE ? OR lower(projects.description) LIKE ?", term, term)
  end


end
