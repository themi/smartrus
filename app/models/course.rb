# == Schema Information
#
# Table name: courses
#
#  id          :bigint(8)        not null, primary key
#  category_id :bigint(8)
#  name        :string
#  description :string
#  objective   :string
#  reason_why  :string
#  parent_id   :bigint(8)
#  lineage     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ApplicationRecord
  belongs_to :category
  has_one :course_header
  has_many :qualifications
  has_many :audio_visuals, as: :imageable
  has_many :definitions
  has_many :prerequisites

  include HasLineage
  has_lineage tree_key_column: "category_id", order_column: "name"

  def prefix
    Courseify.titleize(hierarchy_depth - 1, sibling_position)
  end

  def title
    prefix + ": #{self.name}"
  end

  def grouping
    category.to_s
  end
end
