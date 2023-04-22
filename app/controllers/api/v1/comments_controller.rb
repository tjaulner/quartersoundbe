module Api
    module V1
      class CommentsController < Api::V1::ApplicationController
        skip_before_action :authenticate, only: %i[show index]

        #get all
        def index
            comments = Comment.all
            payload = {
                comments: CommentBlueprint.render_as_hash(comments),
                status: 200
              }
              render_success(payload: payload)
        end

        # GET singular
        def show
            comment = Comment.find(params[:id])

            payload = {
            comment: CommentBlueprint.render_as_hash(comments),
            status: 200
            }
            render_success(payload: payload)
        end

        # POST /api/v1/comments
        def create
            result = Comments::Operations.new_comment(params, @current_user, @post, @playlist)
            render_error(errors: result.errors.all, status: 400) and return unless result.success?
            payload = {
            comment: CommentBlueprint.render_as_hash(result.payload),
            status: 201
            }
            render_success(payload: payload)
        end

        def destroy
            comment = Comment.find(params[:id])

            comment.destroy
            render_success(payload: "Comment has been deleted", status:200)
        end

    end  
    end
end


