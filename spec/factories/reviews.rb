FactoryBot.define do
  factory :review do
    rate { 2.5 }
    comment { "comment_test" }
    souvenir
  end
end
