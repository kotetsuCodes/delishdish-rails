class AddDishToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :dishes, :user
  end
end
