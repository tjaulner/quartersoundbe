module Playlists
    module Operations
        def self.new_playlist(params, current_user)
            playlist = current_user.playlists.new(playlist_name: params[:playlist_name], about: params[:about])

            return ServiceContract.success(playlist) if playlist.save

            ServiceContract.error(playlist.errors.full_messages)
        end
        def self.update_playlist(params)
            playlist = Playlist.find(params[:id])
            return ServiceContract.success(playlist) if playlist.update(playlist_name: params[:playlist_name], about: params[:about])

            ServiceContract.error(playlist.errors.full_messages)
        end
    end
end