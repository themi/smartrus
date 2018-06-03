require 'rails_helper'

RSpec.describe "definitions/show", type: :view do
  before(:each) do
    @definition = assign(:definition, Definition.create!(
      :word => "Word",
      :description => "Description",
      :audio_visual_link => "Audio Visual Link",
      :positive_examples => "MyText",
      :negative_examples => "MyText",
      :origin => "Origin",
      :reference => "Reference"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Word/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Audio Visual Link/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/Reference/)
  end
end
