# == Schema Information
#
# Table name: categories
#
#  id           :bigint(8)        not null, primary key
#  grouping     :string
#  sub_grouping :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :category do
    grouping      { FFaker::Lorem.word }
  end
end
