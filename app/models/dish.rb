class Dish < ApplicationRecord
  belongs_to :user, optional: true
  has_many :shoppinglist_dishes
  has_many :shoppinglists, through: :shoppinglist_dishes
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

  validates_presence_of :title
  accepts_nested_attributes_for :instructions, :ingredients
end
