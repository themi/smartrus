class Qualification < ApplicationRecord
  belongs_to :lesson
  has_many :transcripts
  acts_as_list scope: :lesson
end
