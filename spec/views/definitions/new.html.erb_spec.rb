require 'rails_helper'

RSpec.describe "definitions/new", type: :view do
  before(:each) do
    assign(:definition, Definition.new(
      :word => "MyString",
      :description => "MyString",
      :audio_visual_link => "MyString",
      :positive_examples => "MyText",
      :negative_examples => "MyText",
      :origin => "MyString",
      :reference => "MyString"
    ))
  end

  it "renders new definition form" do
    render

    assert_select "form[action=?][method=?]", definitions_path, "post" do

      assert_select "input[name=?]", "definition[word]"

      assert_select "input[name=?]", "definition[description]"

      assert_select "input[name=?]", "definition[audio_visual_link]"

      assert_select "textarea[name=?]", "definition[positive_examples]"

      assert_select "textarea[name=?]", "definition[negative_examples]"

      assert_select "input[name=?]", "definition[origin]"

      assert_select "input[name=?]", "definition[reference]"
    end
  end
end
