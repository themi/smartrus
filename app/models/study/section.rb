class Study::Section < ::Study
  belongs_to :studyable, polymorphic: true
  has_many :parts, as: :studyable
  has_many :qualifications, as: :studyable
  has_many :audio_visuals, as: :studyable
  has_many :definition_links, class_name: "::DefinitionLink", as: :studyable
  has_many :definitions, through: :definition_links, class_name: "::Definition"
  acts_as_list scope: :studyable
end
