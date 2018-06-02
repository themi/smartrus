require 'rails_helper'

RSpec.describe Admins::DashboardController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      sign_in create(:admin)
      get :index
      expect(response).to be_successful
    end
  end

end
