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

FactoryBot.define do
  factory :transcript do
    language "MyString"
    body "MyText"
    audio_visual nil
  end
end
