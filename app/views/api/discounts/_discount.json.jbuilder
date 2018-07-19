json.id discount.id
json.name discount.name
json.description discount.description
json.brand discount.brand
json.discounted_price discount.discounted_price
json.date_available discount.date_available
json.locations do
  json.array! discount.locations, partial: "api/locations/location", as: :location
end