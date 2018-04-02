class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :title
      t.string :quantity_name
      t.string :quantity_value
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
