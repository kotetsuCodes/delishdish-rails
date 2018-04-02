class CreateShoppinglistDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoppinglist_dishes do |t|
      t.string :shoppinglist_id
      t.string :dish_id

      t.timestamps
    end
  end
end
