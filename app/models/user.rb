class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :projects
  has_many :projects
  has_many :categories

  include DeviseTokenAuth::Concerns::User
end
