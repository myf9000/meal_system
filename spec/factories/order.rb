FactoryGirl.define do
  factory :order do 
  	status "ordered"
  	user
  	meal
  end
end