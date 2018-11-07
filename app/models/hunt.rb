class Hunt < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  belongs_to :user #owner
  has_many :comments
  has_many :tasks
  belongs_to :category

  validates :name, :difficulty_level, :hunt_time, :hunt_date, presence: true
  validates :hunt_date, inclusion:{ in: (Date.today..Date.today+6.months)}


end
