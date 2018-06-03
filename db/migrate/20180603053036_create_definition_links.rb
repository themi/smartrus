class CreateDefinitionLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :definition_links do |t|
      t.integer :definition_id
      t.integer :studyable_id
      t.string  :studyable_type
      t.timestamps
    end
  end
end
