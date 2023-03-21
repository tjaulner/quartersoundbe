class CreatePlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :playlists do |t|
      t.string :playlist_name
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
