class CreatePrerequisite < ActiveRecord::Migration[5.2]
  def change
    create_table :prerequisites do |t|
      t.integer :position
      t.string :description
      t.string :reference_url
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :prerequisites, [:course_id, :position], name: "index_prerequisites_position"
  end
end
