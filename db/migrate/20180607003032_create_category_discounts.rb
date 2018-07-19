class CreateCategoryDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :category_discounts do |t|
      t.integer :discount_id
      t.integer :category_id

      t.timestamps
    end
  end
end
