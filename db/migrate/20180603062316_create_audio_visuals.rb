class CreateAudioVisuals < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_visuals do |t|
      t.integer :position
      t.string :source
      t.integer :studyable_id
      t.string  :studyable_type

      t.timestamps
    end
    add_index :audio_visuals, [:studyable_id, :studyable_type, :position], name: "index_audio_visuals_position"
  end
end
