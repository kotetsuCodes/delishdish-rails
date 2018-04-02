FactoryBot.define do
  factory :ingredient do
    title { Faker::Food.ingredient }
    quantity_name { Faker::Measurement.volume('all') }
    quantity_value { Faker::Number.between(1, 10) }
    dish_id nil
  end
end
