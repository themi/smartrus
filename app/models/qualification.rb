class Qualification < ApplicationRecord
  belongs_to :studyable, polymorphic: true
  acts_as_list scope: :studyable
end
