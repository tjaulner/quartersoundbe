module Comments
    module Operations
        def self.new_comment(params, current_user, post, playlist)
            comment = current_user.comments.new(
                body: params[:body],
                post_id: params[:post_id],
                )

            return ServiceContract.success(comment) if comment.save

            ServiceContract.error(comment.errors.full_messages)
        end
        
    end
end