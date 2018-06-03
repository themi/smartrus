class CreateAudioVisuals < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_visuals do |t|
      t.integer :position
      t.string :source
      t.references :lesson, foreign_key: true

      t.timestamps
    end
    add_index :audio_visuals, [:lesson_id, :position], name: "index_audio_visuals_position"
  end
end
