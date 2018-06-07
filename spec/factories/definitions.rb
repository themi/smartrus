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

FactoryBot.define do
  factory :definition do
    word "MyString"
    description "MyString"
    audio_visual_link "MyString"
    positive_examples "MyText"
    negative_examples "MyText"
    origin "MyString"
    reference "MyString"
  end
end
