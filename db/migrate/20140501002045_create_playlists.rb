class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name, null: false
      t.string :cover
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :playlists, :user_id, name: 'user_id_ix'
  end
end
