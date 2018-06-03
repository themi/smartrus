class CreateCourse < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :category, foreign_key: true, null: true
      t.string :name
      t.string :description
      t.string :objective
      t.string :reason_why
      t.bigint :parent_id, null: true
      t.string :lineage, null: true

      t.timestamps
    end
    add_index :courses, [:category_id, :name], name: "index_courses_name"
    add_index :courses, [:category_id, :lineage], name: "index_courses_lineage"
  end
end
