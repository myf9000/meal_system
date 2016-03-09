food_arr = %w{Hamburger Pancakes Cake Fruits Milk Pizza Pierogi Chips Fish Chicken Beef Tomato Soup Cucamber Ham Sandwich Eggs Carrot Cola Pepsi Water Kebab Pasta}

Fabricator(:meal) do
  name { food_arr.sample }
  cost { Faker::Commerce.price }
  active true
end