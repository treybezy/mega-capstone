class CategoryDiscount < ApplicationRecord
  belongs_to :discount
  belongs_to :category
end
