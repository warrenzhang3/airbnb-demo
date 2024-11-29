class AddImageUrlToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :image_url, :string
  end
end
