class CreateSongSituations < ActiveRecord::Migration[6.1]
  def change
    create_table :song_situations do |t|
      t.references :song, null: false, foreign_key: true
      t.references :situation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
