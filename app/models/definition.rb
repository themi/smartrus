# == Schema Information
#
# Table name: definitions
#
#  id                :bigint(8)        not null, primary key
#  position          :integer
#  word              :string
#  description       :string
#  audio_visual_link :string
#  positive_examples :text
#  negative_examples :text
#  origin            :string
#  reference         :string
#  course_id         :bigint(8)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Definition < ApplicationRecord
  belongs_to :course
  has_many :transcripts
  has_many :audio_visuals, as: :imageable
  acts_as_list scope: :course
end
