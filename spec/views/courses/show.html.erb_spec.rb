require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :name => "Name",
      :description => "Description",
      :objective => "Objective",
      :reason_why => "Reason Why"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Objective/)
    expect(rendered).to match(/Reason Why/)
  end
end
