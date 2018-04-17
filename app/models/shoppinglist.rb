class Shoppinglist < ApplicationRecord
  has_many :shoppinglist_dishes
  has_many :dishes, through: :shoppinglist_dishes

end
