# == Schema Information
#
# Table name: course_headers
#
#  id         :bigint(8)        not null, primary key
#  course_id  :bigint(8)
#  status     :integer          default("editing")
#  owner_id   :integer
#  owner_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryBot.define do
  factory :course_header do
    course
    owner    { create :supervisor }
  end
end
