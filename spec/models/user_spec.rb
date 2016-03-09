require 'rails_helper'


RSpec.describe User, type: :model do

	it "has a valid user" do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  describe "validations" do
  	# Basic validations
  	it { expect(user).to validate_presence_of(:uid) }
  	it { expect(user).to validate_presence_of(:provider) }
  end

	describe "associations" do
  	it { expect(user).to have_many(:orders)}
  	it { expect(user).to have_many(:meals)}
  end
  
end