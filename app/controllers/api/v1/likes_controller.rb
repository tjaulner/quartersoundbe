module Api
    module V1
      class LikesController < Api::V1::ApplicationController
        skip_before_action :authenticate, only: %i[show index]

        #get all
        def index
            likes = Like.all
            likes = Like.all.order(created_at: :desc)
            payload = {
                likes: PostBlueprint.render_as_hash(posts),
                status: 200
              }
              render_success(payload: payload)
        end

        # GET singular
        def show
            like = Like.find(params[:id])

            payload = {
            like: PostBlueprint.render_as_hash(like),
            status: 200
            }
            render_success(payload: payload)
        end

        # POST /api/v1/posts
        def create
            result = Likes::Operations.new_like(params, @current_user, @post, @comment, @playlist)
            render_error(errors: result.errors.all, status: 400) and return unless result.success?
            payload = {
            like: LikeBlueprint.render_as_hash(result.payload),
            status: 201
            }
            render_success(payload: payload)
        end

        def update
            result = Likes::Operations.update_like(params)
            render_error(errors: result.errors.all, status: 400) and return unless result.success?
            payload = {
                like: PostBlueprint.render_as_hash(result.payload),
                status: 201
            }
            render_success(payload: payload)
        end

        def destroy
            like = Like.find(params[:id])

            like.destroy
            render_success(payload: "Like has been deleted", status:200)
        end

    end  
    end
end