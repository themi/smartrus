class AudioVisual < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_many :transcripts
  acts_as_list scope: :imageable
end
