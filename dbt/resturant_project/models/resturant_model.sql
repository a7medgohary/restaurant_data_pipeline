SELECT
  name,
  id,
  address,
  phone_number,
  rating,
  price_range,
  opening_hours,
  delivery_options,
  delivery_fee,
  delivery_time,
  image_url,
  website,
  description,
  popular_dishes,
  average_cost_for_two,
  cuisines
FROM
  `fooddelivary-456823.food_analytics.resturant` AS restaurant
LIMIT 100
