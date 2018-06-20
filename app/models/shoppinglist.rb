class Shoppinglist < ApplicationRecord
  belongs_to :user, optional: true
  has_many :shoppinglist_dishes
  has_many :dishes, through: :shoppinglist_dishes
end
