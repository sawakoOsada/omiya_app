FactoryBot.define do
  factory :review do
    id { 1 }
    rate { 2.5 }
    comment { "comment_test" }
    souvenir
  end
end
