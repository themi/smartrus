class AudioVisual < ApplicationRecord
  belongs_to :imageable, :polymorphic => true
  has_many :transcripts
  acts_as_list :scope => [:imageable, :purpose]
  validates :purpose, :inclusion => { :in => %w(mass instructional) }
end
