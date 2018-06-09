# == Schema Information
#
# Table name: categories
#
#  id           :bigint(8)        not null, primary key
#  grouping     :string
#  sub_grouping :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


require 'rails_helper'

RSpec.describe Category, type: :model do
  subject(:cat) { create :category, grouping: "grouping", sub_grouping: "sub_grouping" }

  it "#to_s returns category full group" do
    expect(cat.to_s).to match "grouping - sub_grouping"
  end

end
