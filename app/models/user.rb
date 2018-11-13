class User < ApplicationRecord
  has_secure_password

  has_many :participations
  has_many :participated_hunts, through: :participations, source: :hunt
  has_many :completed_tasks
  has_many :tasks, through: :completed_tasks
  has_many :hunts #owned_hunt
  has_many :comments

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
end
