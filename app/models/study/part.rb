class Study::Part < ::Study
  belongs_to :studyable, polymorphic: true
  has_many :definition_links, class_name: "::DefinitionLink", as: :studyable
  has_many :definitions, through: :definition_links, class_name: "::Definition"
  has_many :qualifications, as: :studyable
  has_many :audio_visuals, as: :studyable
  acts_as_list scope: :studyable
end
