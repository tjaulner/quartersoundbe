module Likes
    module Operations
        def self.new_like(params, current_user, post, comment, playlist) 
            like = current_user.likes.new(
                post_id: params[:post_id],
                playlist_id: params[:playlist_id])


            return ServiceContract.success(like) if like.save

            ServiceContract.error(like.errors.full_messages)
        end
        
    end
end