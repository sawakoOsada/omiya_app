FactoryBot.define do
  factory :user do
    sequence(:email) { "user@test.com" }
    password { "user_password" }
  end
end
