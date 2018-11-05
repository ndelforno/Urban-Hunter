class Hunt < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  belongs_to :user #owner
  has_many :comments
  has_many :tasks
  belongs_to :category

  validates :name, :difficulty_level, :date_time, presence: true
  validates :date_time, inclusion:{ in: (Date.today..Date.today+6.months)}


end
