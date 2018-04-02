class CreateDishinstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :dishinstructions do |t|
      t.integer :order
      t.string :instruction_content
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
