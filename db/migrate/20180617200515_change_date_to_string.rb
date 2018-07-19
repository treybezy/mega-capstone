class ChangeDateToString < ActiveRecord::Migration[5.2]
  def change
    change_column :discounts, :date_available, :string
  end
end
