class AudioVisual < ApplicationRecord
  belongs_to :studyable, polymorphic: true
  has_many :transcripts
  acts_as_list scope: :studyable
end
