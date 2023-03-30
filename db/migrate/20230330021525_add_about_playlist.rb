class AddAboutPlaylist < ActiveRecord::Migration[7.0]
  def change
    add_column :playlists, :about, :string
  end
end
