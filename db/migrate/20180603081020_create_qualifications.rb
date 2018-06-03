class CreateQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.integer :position
      t.text :question
      t.text :answer_reference
      t.references :lesson, foreign_key: true

      t.timestamps
    end
    add_index :qualifications, [:lesson_id, :position], name: "index_qualifications_position"
  end
end
