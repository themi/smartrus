class CreateStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :studies do |t|
      t.references :course, foreign_key: true
      t.integer :position
      t.string :name
      t.string :description
      t.string :objective
      t.string :reason_why
      t.string :audio_visual_link
      t.integer :studyable_id
      t.string  :studyable_type

      t.timestamps
    end
    add_index :studies, [:course_id, :studyable_type, :studyable_id, :name], name: "index_studies_name"
    add_index :studies, [:course_id, :studyable_type, :studyable_id, :position], name: "index_studies_position"
  end
end
