# == Schema Information
#
# Table name: prerequisites
#
#  id            :bigint(8)        not null, primary key
#  position      :integer
#  description   :string
#  reference_url :string
#  course_id     :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Prerequisite, type: :model do
  it { is_expected.to validate_presence_of(:description) }
end
