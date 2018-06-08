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

class CourseHeader < ApplicationRecord
  enum status: [:editing, :review, :published, :restricted, :archived]
  belongs_to :course
  belongs_to :owner, polymorphic: true
end
