class Hunt < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  belongs_to :user #owner
  has_many :comments
  has_many :tasks
  belongs_to :category

  validates :name, :difficulty_level, :category, :hunt_time, :hunt_date, presence: true
  validates :hunt_date, inclusion:{ in: (Date.today..Date.today+6.months)}
  validates :max_participants, inclusion: { in: (1..20)}

  def difflevel_int_to_text
    case self.difficulty_level
    when 1
      return "Easy"
    when 2
      return "Average"
    when 3
      return "Hard"
    end
  end

end
