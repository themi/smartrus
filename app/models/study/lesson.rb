class Study::Lesson < ::Study
  belongs_to :course
  has_many :sections, as: :studyable
  has_many :qualifications, as: :studyable
  has_many :audio_visuals, as: :studyable
  has_many :definition_links, class_name: "::DefinitionLink", as: :studyable
  has_many :definitions, through: :definition_links, class_name: "::Definition"
  acts_as_list scope: :course
end
