class User < ApplicationRecord
has_secure_password

  has_many :participations
  has_many :hunts, through: :participations
  has_many :completed_tasks
  has_many :tasks, through: :completed_tasks
  has_many :hunts #owned_hunt
  has_many :comments

  validates :first_name, :last_name, presence: true
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true
end
