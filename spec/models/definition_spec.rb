# == Schema Information
#
# Table name: definitions
#
#  id            :bigint(8)        not null, primary key
#  position      :integer
#  word          :string
#  reference_url :string
#  course_id     :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


require 'rails_helper'

RSpec.describe Definition, type: :model do
  it { is_expected.to validate_presence_of(:word) }
end
