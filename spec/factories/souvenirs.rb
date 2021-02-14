FactoryBot.define do
  factory :souvenir do
    name { "souvenir_sample1" }
    price { 100 }
    prefecture_id { 1 }
  end
  factory :souvenir2, class: Souvenir do
    name { "souvenir_sample2" }
    price { 200 }
    prefecture_id { 2 }
  end
end
