class CompletedTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # validates :proof, :completed, presence: true
end
