class CreateLocationDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :location_discounts do |t|
      t.integer :discount_id
      t.integer :location_id

      t.timestamps
    end
  end
end
