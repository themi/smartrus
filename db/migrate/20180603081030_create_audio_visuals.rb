class CreateAudioVisuals < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_visuals do |t|
      t.integer :position
      t.string :source_url
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps
    end
    add_index :audio_visuals, [:imageable_id, :imageable_type], name: "index_audio_visuals_imageable"
    add_index :audio_visuals, [:imageable_id, :imageable_type, :position], name: "index_audio_visuals_position"
  end
end
