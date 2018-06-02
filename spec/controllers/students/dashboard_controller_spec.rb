require 'rails_helper'

RSpec.describe Students::DashboardController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      sign_in create(:student)
      get :index
      expect(response).to be_successful
    end
  end

end
