require 'rails_helper'

RSpec.describe "definitions/index", type: :view do
  before(:each) do
    assign(:definitions, [
      Definition.create!(
        :word => "Word",
        :description => "Description",
        :audio_visual_link => "Audio Visual Link",
        :positive_examples => "MyText",
        :negative_examples => "MyText",
        :origin => "Origin",
        :reference => "Reference"
      ),
      Definition.create!(
        :word => "Word",
        :description => "Description",
        :audio_visual_link => "Audio Visual Link",
        :positive_examples => "MyText",
        :negative_examples => "MyText",
        :origin => "Origin",
        :reference => "Reference"
      )
    ])
  end

  it "renders a list of definitions" do
    render
    assert_select "tr>td", :text => "Word".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Audio Visual Link".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
  end
end
