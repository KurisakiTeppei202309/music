class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :genre
      t.string :feel
      t.string :situation
      t.string :url

      t.timestamps
    end
  end
end
