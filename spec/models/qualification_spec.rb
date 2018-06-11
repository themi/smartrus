# == Schema Information
#
# Table name: qualifications
#
#  id               :bigint(8)        not null, primary key
#  position         :integer
#  question         :text
#  answer_reference :text
#  course_id        :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#


require 'rails_helper'

RSpec.describe Qualification, type: :model do
  it { is_expected.to validate_presence_of(:question) }
end
