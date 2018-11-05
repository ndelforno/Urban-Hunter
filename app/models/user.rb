class User < ApplicationRecord
has_secure_password

  has_many :participations
  has_many :hunts, through: :participations
  has_many :completed_tasks
  has_many :tasks, through: :completed_tasks
  has_many :hunts #owned_hunt
  has_many :comments

  validates :first_name, :last_name, presence: true
end
