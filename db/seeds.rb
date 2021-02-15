47.times do |n|
  Souvenir.create!(
    name: "sample#{n + 1}",
    price: n+100,
    prefecture_id: n+1
  )
end
20.times do |n|
  User.create!(
    email: "sample#{n + 1}@email.com",
    password: 'sample_password',
    confirmed_at: Time.now
  )
end
# 20.times do |n|
#   Review.create!(
#     souvenir_id: n+1,
#     rate: rand(1..5),
#     comment: 'sample_review'
#   )
end
20.times do |n|
  Address.create!(
    user_id: n+1,
    name: 'sample_name',
    zip: '1111111',
    prefecture_id: n+1,
    city: 'sample_city',
    town: 'sample_town',
    building: 'sample_building'
  )
end
