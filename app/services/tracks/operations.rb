module Tracks
    module Operations
        def self.new_track(params, current_user)
            track = current_user.tracks.new(
                artist: params[:artist], 
                trackname: params[:trackname], 
                album: params[:album], 
                year: params[:year], 
                genre: params[:genre], 
                play_preview_url: params[:play_preview_url],
                album_img_url: params[:album_img_url],
                playlist_id: params[:playlist_id],
                user_id: params[:user_id])
            return ServiceContract.success(track) if track.save

            ServiceContract.error(track.errors.full_messages)
        end
        
    end
end