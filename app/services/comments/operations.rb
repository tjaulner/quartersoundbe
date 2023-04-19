module Comments
    module Operations
        def self.new_comment(params, current_user)
            comment = current_user.comments.new(
                user_id: params[:user_id],#need to finish this, do posts first
                body: params[:body])

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