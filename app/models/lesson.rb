class Lesson < ApplicationRecord
  belongs_to :course

  has_many :qualifications
  has_many :audio_visuals
  has_many :definitions

  belongs_to :parent, class_name: "Lesson", inverse_of: :children, required: false
  has_many :children, class_name: "Lesson", foreign_key: "parent_id", inverse_of: :parent

  acts_as_list scope: :course

  def add_child(name)
    self.children.create(course: self.course, name: name, level: self.level+1)
  end
end
