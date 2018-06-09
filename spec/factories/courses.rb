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

FactoryBot.define do
  factory :course do
    category
    name        { FFaker::Lorem.words }
    description { FFaker::Lorem.paragraph }
    objective   { FFaker::Lorem.sentence }
    reason_why  { FFaker::Lorem.paragraph }
  end
end
