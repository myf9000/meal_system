require 'rails_helper'


RSpec.describe Meal, type: :model do

	it "has a valid meal" do
    expect(build(:meal)).to be_valid
  end

  let(:meal) { build(:meal) }

  describe "validations" do
  	# Basic validations
  	it { expect(meal).to validate_presence_of(:name) }
  	it { expect(meal).to validate_presence_of(:cost) }
  	
  	# Inclusion/acceptance of values
  	it { expect(meal).to validate_length_of(:name).is_at_least(2).is_at_most(30) }
  	it { expect(meal).to validate_numericality_of(:cost) }

  	# Format validations
  	invalid_regex = "R<>%@?!"
  	it { expect(meal).to_not allow_value(invalid_regex).for(:name) }
  	it { expect(meal).to_not allow_value(invalid_regex).for(:cost) }
  end

	describe "associations" do
  	it { expect(meal).to have_one(:order) }
  end
  
end