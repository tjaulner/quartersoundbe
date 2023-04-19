module Api
    module V1
      class CommentsController < Api::V1::ApplicationController
        skip_before_action :authenticate, only: %i[show index]

        #get all
        def index
            comments = Comment.all
            payload = {
                tracks: CommentBlueprint.render_as_hash(comments),
                status: 200
              }
              render_success(payload: payload)
        end

        # GET singular
        def show
            comment = Comment.find(params[:id])

            payload = {
            tracks: CommentBlueprint.render_as_hash(comments),
            status: 200
            }
            render_success(payload: payload)
        end

        # POST /api/v1/comments
        def create
            result = Comments::Operations.new_track(params, @current_user)
            render_error(errors: result.errors.all, status: 400) and return unless result.success?
            payload = {
            track: TrackBlueprint.render_as_hash(result.payload),
            status: 201
            }
            render_success(payload: payload)
        end

    end  
    end
end


