class Location < ApplicationRecord
  has_many :location_discounts
  has_many :discounts, through: :location_discounts
end
