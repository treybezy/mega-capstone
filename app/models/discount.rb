class Discount < ApplicationRecord
  has_many :location_discounts
  has_many :locations, through: :location_discounts
  has_many :users
  has_many :categories
end
