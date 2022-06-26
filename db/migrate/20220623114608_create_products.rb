class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :details, null: false
      t.integer :user_id, null: false
      t.integer :price, null: false

      # add_reference :products, :user, foreign_key: true

      t.timestamps
    end
  end
end
