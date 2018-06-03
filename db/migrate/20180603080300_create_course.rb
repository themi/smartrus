class CreateCourse < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :category
      t.string :name
      t.string :description
      t.string :objective
      t.string :reason_why
      t.bigint :parent_id, null: true
      t.string :lineage, null: true

      t.timestamps
    end
    add_index :courses, [:category, :name], name: "index_courses_name"
  end
end
