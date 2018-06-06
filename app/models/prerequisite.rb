# == Schema Information
#
# Table name: prerequisites
#
#  id            :bigint(8)        not null, primary key
#  position      :integer
#  description   :string
#  reference_url :string
#  course_id     :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Prerequisite < ApplicationRecord
  belongs_to :course
  acts_as_list scope: :course
end
