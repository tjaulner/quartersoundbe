class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :artist
      t.string :trackname
      t.string :album
      t.integer :year
      t.string :genre
      t.string :play_preview_url
      t.string :album_img_url
      t.belongs_to :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
