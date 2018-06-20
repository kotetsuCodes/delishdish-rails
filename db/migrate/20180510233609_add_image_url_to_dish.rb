class AddImageUrlToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :image_url, :string
  end
end
