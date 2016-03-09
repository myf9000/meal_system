require 'rails_helper'


RSpec.describe Order, type: :model do

	it "has a valid order" do
    expect(build(:order)).to be_valid
  end

  let(:order) { build(:order) }

  describe "validations" do
  	# Basic validations
  	it { expect(order).to validate_presence_of(:user_id) }
  	it { expect(order).to validate_presence_of(:status) }
  	
  	# Inclusion/acceptance of values
  	it { expect(order).to validate_length_of(:status).is_at_least(2).is_at_most(30) }

  	# Format validations
  	invalid_regex = "R<>%@?!"
  	it { expect(order).to_not allow_value(invalid_regex).for(:status) }
  end

	describe "associations" do
  	it { expect(order).to belong_to(:meal) }
  	it { expect(order).to belong_to(:user) }
  end
  
end