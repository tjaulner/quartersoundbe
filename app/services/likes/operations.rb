module Likes
    module Operations
        def self.new_like(params, current_user, post, comment, playlist, reply) 
            like = current_user.likes.new(
                post_id: params[:post_id],
                playlist_id: params[:playlist_id],
                comment_id: params[:comment_id],
                reply_id: params[:reply_id])


            return ServiceContract.success(like) if like.save

            ServiceContract.error(like.errors.full_messages)
        end
        
    end
end