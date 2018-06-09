# == Schema Information
#
# Table name: courses
#
#  id          :bigint(8)        not null, primary key
#  category_id :bigint(8)
#  name        :string
#  description :string
#  objective   :string
#  reason_why  :string
#  parent_id   :bigint(8)
#  lineage     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Course, type: :model do

  context "with a sample course" do
    let(:cat) { create :category, grouping: "grouping" }
    subject(:cse) { create :course, category: cat }

    it "#prefix calls the titleizer function" do
      expect(Courseify).to receive(:titleize)
      cse.prefix
    end

    it "#grouping returns the category grouping" do
      expect(cse.grouping).to match cat.grouping
    end

    it "#title prefixes the course name" do
      expect(Courseify).to receive(:titleize) { "title" }
      expect(cse.title).to match "title: #{cse.name}"
    end
  end
end
