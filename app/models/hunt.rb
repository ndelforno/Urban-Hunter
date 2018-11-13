class Hunt < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  belongs_to :user #owner
  has_many :comments
  has_many :tasks
  belongs_to :category

  # scope :chronological_order, -> {order(hunt_date: :desc)}
  # scope :past_hunts, -> {where("'#{Date.today}' > hunt_date").order(hunt_date: :desc)}



  validates :name, :difficulty_level, :category, :hunt_time, :hunt_date, :max_participants, presence: true
  # validates :hunt_date, inclusion:{ in: (Date.today-6.months..Date.today+6.months)}
  # validates :hunt_time, inclusion:{ in: (8.hours..20.hours)}
  validates :max_participants, inclusion: { in: (1..20)}

  def self.future_hunts #class method, must be an ActiveRecord Relation fo this to work or be called on the Class.
    self.where('hunt_date > ?', Date.today).order(hunt_date: :asc)
  end

  def self.past_hunts
    self.where('hunt_date < ?', Date.today).order(hunt_date: :desc)
  end



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

  def available_spots
    return self.max_participants - self.users.count
  end

  def hunt_exists_on_that_day?
    answer = []
    my_created_hunts = self.user.hunts
    answer << my_created_hunts.find_by(hunt_date: self.hunt_date)
    answer.nil? ? true : false
  end

end
