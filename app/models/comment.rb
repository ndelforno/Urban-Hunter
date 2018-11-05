class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hunt

  validates :description, presence: true
end
