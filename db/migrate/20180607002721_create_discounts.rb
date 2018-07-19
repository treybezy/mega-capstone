class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :description
      t.string :brand
      t.decimal :discounted_price
      t.date :date_available

      t.timestamps
    end
  end
end
