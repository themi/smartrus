class CourseHeader < ApplicationRecord
  enum status: [:editing, :review, :published, :restricted, :archived]

  belongs_to :course
  belongs_to :owner, polymorphic: true

  def course_name
    course.name
  end
end
