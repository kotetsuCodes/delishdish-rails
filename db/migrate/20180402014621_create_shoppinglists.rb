class CreateShoppinglists < ActiveRecord::Migration[5.1]
  def change
    create_table :shoppinglists do |t|
      t.string :title

      t.timestamps
    end
  end
end
