class Qualification < ApplicationRecord
  belongs_to :course
  acts_as_list scope: :course
end
