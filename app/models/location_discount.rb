class LocationDiscount < ApplicationRecord
  belongs_to :discount
  belongs_to :location
end
