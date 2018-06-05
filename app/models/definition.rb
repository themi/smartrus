class Definition < ApplicationRecord
  belongs_to :course
  has_many :transcripts
  has_many :audio_visuals, as: :imageable
  acts_as_list scope: :course
end
