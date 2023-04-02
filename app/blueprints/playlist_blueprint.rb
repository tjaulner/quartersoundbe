class PlaylistBlueprint < Blueprinter::Base
    identifier :id
    fields :playlist_name, :created_at, :user, :about, :updated_at
end