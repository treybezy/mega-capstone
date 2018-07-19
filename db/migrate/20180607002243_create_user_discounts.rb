class CreateUserDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_discounts do |t|
      t.integer :user_id
      t.integer :discount_id
      t.boolean :favorited

      t.timestamps
    end
  end
end
