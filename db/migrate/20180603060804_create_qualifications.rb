class CreateQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.integer :position
      t.text :question_or_task
      t.text :answer_reference
      t.integer :studyable_id
      t.string  :studyable_type

      t.timestamps
    end
    add_index :qualifications, [:studyable_id, :studyable_type, :position], name: "index_qualifications_position"
  end
end
