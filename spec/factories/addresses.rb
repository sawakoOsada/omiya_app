FactoryBot.define do
  factory :address do
    name { 'user_name' }
    zip { 1111111 }
    prefecture_id { 1 }
    city { 'address_city' }
    town { 'address_town' }
    building { 'address_building' }
    user
  end
end
