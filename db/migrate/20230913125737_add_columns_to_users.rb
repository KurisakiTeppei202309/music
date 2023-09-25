class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :like_genre, :string
    add_column :users, :like_artist, :string
  end
end
