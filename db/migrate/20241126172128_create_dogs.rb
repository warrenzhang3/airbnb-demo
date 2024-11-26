class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :price
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
