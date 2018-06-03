class CreateCourse < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :objective
      t.string :reason_why

      t.timestamps
    end
    add_index :courses, [:category, :name], name: "index_courses_name"
  end
end
