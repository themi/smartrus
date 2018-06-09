# == Schema Information
#
# Table name: audio_visuals
#
#  id             :bigint(8)        not null, primary key
#  position       :integer
#  purpose        :string
#  description    :string
#  source_url     :string
#  imageable_id   :integer
#  imageable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


require 'rails_helper'

RSpec.describe AudioVisual, type: :model do
  it { is_expected.to validate_inclusion_of(:purpose).in_array(AudioVisual::AV_PURPOSES) }
end
