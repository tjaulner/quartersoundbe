module Comments
    module Operations
        def self.new_comment(params, current_user, post, playlist) ##look at not using as code for comment is minimal?
            comment = current_user.comments.new(
                body: params[:body],
                post_id: params[:post_id],
                )

            return ServiceContract.success(comment) if comment.save

            ServiceContract.error(comment.errors.full_messages)
        end
        
    end
end