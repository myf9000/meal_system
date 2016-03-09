FactoryGirl.define do
  factory :meal do 
  	name "Egg"
    cost { Faker::Commerce.price }
  end

  factory :invalid_meal, parent: :meal do 
    name nil
  end
end