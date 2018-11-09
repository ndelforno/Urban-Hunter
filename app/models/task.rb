class Task < ApplicationRecord
  has_many :completed_tasks
  has_many :users, through: :completed_tasks
  belongs_to :hunt

  validates :details, presence: true
  validates :neighbourhood, presence: true
  validates :address, presence: true

  def completed_by_user?(user)
    @tasks_completed = CompletedTask.all
    @tasks_completed.each do |completed|
      p user.id == completed.user_id && self.id == completed.task_id
      if (user.id == completed.user_id && self.id == completed.task_id)
        return true
      end
    end
  end
  
end
