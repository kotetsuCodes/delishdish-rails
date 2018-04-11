class ShoppinglistDish < ApplicationRecord
  belongs_to :dish
  belongs_to :shoppinglist
end
