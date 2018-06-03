class DefinitionLink < ApplicationRecord
  belongs_to :definition, class_name: "::Definition"
  belongs_to :studyable, polymorphic: true
end
