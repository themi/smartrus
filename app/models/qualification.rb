# == Schema Information
#
# Table name: qualifications
#
#  id               :bigint(8)        not null, primary key
#  position         :integer
#  question         :text
#  answer_reference :text
#  course_id        :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Qualification < ApplicationRecord
  belongs_to :course
  has_many :transcripts
  has_many :audio_visuals, as: :imageable
  acts_as_list scope: :course
  validates :question, presence: true
end
