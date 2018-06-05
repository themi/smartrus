class CreateCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :grouping
      t.string :sub_grouping

      t.timestamps
    end
    add_index :categories, [:grouping, :sub_grouping], name: "index_categories_grouping"
  end
end
