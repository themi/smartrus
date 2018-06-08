class CreateCourseHeader < ActiveRecord::Migration[5.2]
  def change
    create_table :course_headers do |t|
      t.references :course, foreign_key: true
      t.integer :status, default: 0
      t.integer :owner_id
      t.string :owner_type

      t.timestamps
    end
    add_index :course_headers, [:owner_id, :owner_type], name: "index_course_headers_owner"
  end
end
