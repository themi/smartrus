class CreateDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :definitions do |t|
      t.integer :position
      t.string :word
      t.string :description
      t.string :audio_visual_link
      t.text :positive_examples
      t.text :negative_examples
      t.string :origin
      t.string :reference
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :definitions, :word, unique: true
  end
end
