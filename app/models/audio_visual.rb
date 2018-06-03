class AudioVisual < ApplicationRecord
  belongs_to :course
  has_many :transcripts
  acts_as_list scope: :course
end
