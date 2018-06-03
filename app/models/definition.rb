class Definition < ApplicationRecord
  has_many :definition_links, class_name: "::DefinitionLink"
  has_many :studyables, through: :definition_links
end
