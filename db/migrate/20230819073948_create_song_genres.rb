class CreateSongGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :song_genres do |t|
      t.references :song, null: false, foreign_key: true
      t.references :genre

      t.timestamps
    end
  end
end
