class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :playlist_id, null: false
      t.string :title, null: false
      t.string :url, null: false

      t.timestamps
    end

    add_index :songs, :playlist_id, name: 'playlist_id_ix'
  end
end
