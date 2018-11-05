class Hunt < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  belongs_to :user #owner
  has_many :comments
  has_many :tasks
  belongs_to :category
end
