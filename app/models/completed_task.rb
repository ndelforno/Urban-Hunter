class CompletedTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  has_one_attached :image

  # validates :proof, :completed, presence: true
end
