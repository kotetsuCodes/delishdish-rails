class Dish < ApplicationRecord
  has_many :shoppinglist_dishes
  has_many :shoppinglists, through: :shoppinglist_dishes
  has_many :ingredients, dependent: :destroy
  has_many :dishinstructions, dependent: :destroy

  validates_presence_of :title
end
