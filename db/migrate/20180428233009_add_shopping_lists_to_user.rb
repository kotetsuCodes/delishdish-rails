class AddShoppingListsToUser < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :shoppinglists, name: "fk_rails_c4e093e1b7"
    add_reference :shoppinglists, :user
  end
end
