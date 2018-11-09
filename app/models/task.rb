class Task < ApplicationRecord
  has_many :completed_tasks
  has_many :users, through: :completed_tasks
  belongs_to :hunt

  validates :details, presence: true
  validates :neighbourhood, presence: true
  validates :address, presence: true

end
