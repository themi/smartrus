require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new(
      :name => "MyString",
      :description => "MyString",
      :objective => "MyString",
      :reason_why => "MyString"
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input[name=?]", "course[name]"

      assert_select "input[name=?]", "course[description]"

      assert_select "input[name=?]", "course[objective]"

      assert_select "input[name=?]", "course[reason_why]"
    end
  end
end
