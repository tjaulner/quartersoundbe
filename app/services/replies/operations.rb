module Replies
    module Operations
        def self.new_reply(params, current_user, comment)
            reply = current_user.replies.new(
                body: params[:body],
                comment_id: params[:comment_id],
                user_id: params[:user_id],
                )

            return ServiceContract.success(reply) if reply.save

            ServiceContract.error(reply.errors.full_messages)
        end
        
    end
end