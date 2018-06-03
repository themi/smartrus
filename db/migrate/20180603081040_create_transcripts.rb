class CreateTranscripts < ActiveRecord::Migration[5.2]
  def change
    create_table :transcripts do |t|
      t.string :language
      t.text :body
      t.references :audio_visual, foreign_key: true

      t.timestamps
    end
    add_index :transcripts, [:audio_visual_id, :language], name: "index_transcripts_language"
  end
end
