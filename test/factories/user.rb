FactoryBot.define do
  factory :user do
    first_name {"Nick"}
    last_name {"Smith"}
    email {'nick@hotmail.com'}
    password {'password123'}
  end
end
