class CreateDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :definitions do |t|
      t.integer :position
      t.string :word
      t.string :reference_url
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :definitions, :word, unique: true
    add_index :definitions, [:course_id, :position], name: "index_definitions_position"
  end
end
