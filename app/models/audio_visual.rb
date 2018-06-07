# == Schema Information
#
# Table name: audio_visuals
#
#  id             :bigint(8)        not null, primary key
#  position       :integer
#  purpose        :string
#  description    :string
#  source_url     :string
#  imageable_id   :integer
#  imageable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AudioVisual < ApplicationRecord
  belongs_to :imageable, :polymorphic => true
  has_many :transcripts
  acts_as_list :scope => [:imageable, :purpose]
  validates :purpose, :inclusion => { :in => %w(mass instructional) }
end
