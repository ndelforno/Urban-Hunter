class WelcomeController < ApplicationController
  def index
    @categories = Category.all
    # @future_hunts_first = Hunt.future_hunts.first
    # @future_hunts_five = Hunt.future_hunts[1..4]
    # d = Hunt.future_hunts.first.hunt_date
    # t = Time.parse(Hunt.future_hunts.first.hunt_time.to_s)
    # time = Time.now
    # gon.first_future_hunt_time = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, time.zone)
  end
end
