class Task < ApplicationRecord
  has_many :completed_tasks
  has_many :users, through: :completed_tasks
  belongs_to :hunt

  validates :details, presence: true

  def completed_by_user?(user)
    @tasks_completed = CompletedTask.all
    @tasks_completed.each do |completed|
      if (user.id == completed.user_id && self.id == completed.task_id)
        return true
      end
    end
  end

end
