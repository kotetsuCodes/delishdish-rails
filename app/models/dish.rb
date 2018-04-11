class Dish < ApplicationRecord
  has_many :shoppinglist_dishes
  has_many :shoppinglists, through: :shoppinglist_dishes
  has_many :ingredients
  has_many :dishinstructions

  validates_presence_of :title
end
