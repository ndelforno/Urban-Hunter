# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Category.destroy_all
# Task.destroy_all
# Hunt.destroy_all
# Comment.destroy_all
# CompletedTask.destroy_all
# Participation.destroy_all
#
# 10.times do
# User.create(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   email: Faker::Internet.free_email,
#   password: "123456",
#   password_confirmation: "123456"
#
# )
# end

["tourism", "social", "pub-crawl", "family", "sport"].each do |name|
  Category.create(name: name)
end


#
# 10.times do
#   hunt = Hunt.create(
#     name: Faker::Name.name,
#     user: User.all.sample,
#     category: Category.all.sample,
#     difficulty_level: rand(1..3),
#     hunt_time: Time.now - 18.hours + rand(12).hours,
#     hunt_date: Date.today - 50.days + rand(100).days,
#     max_participants: 20
#   )
#   puts hunt.inspect
#   hunt.save!
#
#     ['task1', 'task2', 'task3', 'task4', 'task5'].each do |task|
#       Task.create(
#         details: task,
#         hunt: hunt
#       )
#     end
#
#
#     rand(18..20).times do
#     Participation.create(
#       user: User.all.sample,
#       hunt: hunt
#     )
#     end
#
#     2.times do
#     CompletedTask.create(
#       proof: "done",
#       user: hunt.users.sample,
#       task: hunt.tasks.sample
#     )
#     end
#
#     3.times do
#     Comment.create(
#       description: "good",
#       user: hunt.users.sample,
#       hunt: hunt
#     )
#     end
#
# end
