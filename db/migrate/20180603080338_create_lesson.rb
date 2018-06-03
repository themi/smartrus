class CreateLesson < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :course, foreign_key: true
      t.integer :position
      t.string :name
      t.string :description
      t.string :objective
      t.string :reason_why
      t.integer :level, default: 0
      t.bigint :parent_id, null: true

      t.timestamps
    end
    add_index :lessons, [:course_id, :parent_id, :name], name: "index_lessons_name"
    add_index :lessons, [:course_id, :parent_id, :position], name: "index_lessons_position"
  end
end
