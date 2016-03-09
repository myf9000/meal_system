require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #angular" do
    it "returns http success" do
      get :angular
      expect(response).to have_http_status(:success)
    end
  end

end
