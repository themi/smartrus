# == Schema Information
#
# Table name: course_headers
#
#  id         :bigint(8)        not null, primary key
#  course_id  :bigint(8)
#  status     :integer          default("editing")
#  owner_id   :integer
#  owner_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CourseHeader, type: :model do
  subject(:header) { create :course_header }

  it "#status defaults to editing" do
    expect(header.editing?).to be_truthy
  end
end
