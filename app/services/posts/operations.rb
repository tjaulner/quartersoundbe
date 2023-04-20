module Posts
    module Operations
        def self.new_post(params, current_user)
            post = current_user.posts.new(
                user_id: params[:user_id],
                body: params[:body])

            return ServiceContract.success(post) if post.save

            ServiceContract.error(post.errors.full_messages)
        end
        def self.update_post(params)
            post = Post.find(params[:id])
            return ServiceContract.success(post) if post.update(
                #user_id: params[:user_id], 
                body: params[:body])

            ServiceContract.error(post.errors.full_messages)
        end
    end
end