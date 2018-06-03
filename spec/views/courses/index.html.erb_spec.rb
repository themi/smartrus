require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :name => "Name",
        :description => "Description",
        :objective => "Objective",
        :reason_why => "Reason Why"
      ),
      Course.create!(
        :name => "Name",
        :description => "Description",
        :objective => "Objective",
        :reason_why => "Reason Why"
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Objective".to_s, :count => 2
    assert_select "tr>td", :text => "Reason Why".to_s, :count => 2
  end
end
