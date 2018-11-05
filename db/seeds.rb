# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Category.destroy_all
Task.destroy_all
Hunt.destroy_all
Comment.destroy_all
CompletedTask.destroy_all
Participation.destroy_all


user1 = User.create(
  first_name: "nick"
)

user2 = User.create(
  first_name: "dan"
)

category1 = Category.create(
  name: "tourism"
)

hunt1 = Hunt.create(
  name: "huntville",
  user_id: user1.id,
  category_id: category1.id
)

task1 = Task.create(
  details: "take picture",
  hunt_id: hunt1.id
)

task_user1 = CompletedTask.create(
  proof: "code",
  user_id: user1.id,
  task_id: task1.id
)

comment1 = Comment.create(
  description: "good",
  user_id: user1.id,
  hunt_id: hunt1.id
)

participation1 = Participation.create(
  user_id: user2.id,
  hunt_id: hunt1.id
)
