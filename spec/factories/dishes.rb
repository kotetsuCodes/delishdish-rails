FactoryBot.define do
  factory :dish do
    title { Faker::Food.dish }
    shoppinglist_id nil
  end
end
