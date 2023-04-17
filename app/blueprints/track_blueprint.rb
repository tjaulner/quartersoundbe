class TrackBlueprint < Blueprinter::Base
    identifier :id
    fields :artist, :trackname, :album, :year, :genre, :play_preview_url,
    :album_img_url, :created_at, :updated_at, :playlist, :user
end