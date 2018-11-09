FactoryBot.define do
  factory :hunt do
    name {"Here we are"}
    difficulty_level {"1"}
    hunt_date { DateTime.now.to_date + 10.days }
    category_id {1}
    hunt_time { Time.now + 10.days }
    max_participants {20}
  end
end
