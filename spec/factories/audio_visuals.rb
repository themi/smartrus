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

FactoryBot.define do
  factory :audio_visual do
    position 1
    source "MyString"
  end
end
