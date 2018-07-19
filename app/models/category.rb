class Category < ApplicationRecord
 has_many :category_discounts
 belongs_to :discount
end
