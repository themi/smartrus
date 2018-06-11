# == Schema Information
#
# Table name: transcripts
#
#  id              :bigint(8)        not null, primary key
#  language        :string
#  body            :text
#  audio_visual_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Transcript, type: :model do
  it { is_expected.to validate_presence_of(:language) }
  it { is_expected.to validate_presence_of(:body) }
end
