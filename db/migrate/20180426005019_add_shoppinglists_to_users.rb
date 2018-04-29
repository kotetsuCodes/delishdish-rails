class AddShoppinglistsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :shoppinglists, :users, column: :id
  end
end
