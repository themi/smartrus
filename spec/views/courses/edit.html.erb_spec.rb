require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :name => "MyString",
      :description => "MyString",
      :objective => "MyString",
      :reason_why => "MyString"
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input[name=?]", "course[name]"

      assert_select "input[name=?]", "course[description]"

      assert_select "input[name=?]", "course[objective]"

      assert_select "input[name=?]", "course[reason_why]"
    end
  end
end
