module Api
    module V1
      class RepliesController < Api::V1::ApplicationController
        skip_before_action :authenticate, only: %i[show index]

        #get all
        def index
            replies = Reply.all
            payload = {
                replies: ReplyBlueprint.render_as_hash(replies),
                status: 200
              }
              render_success(payload: payload)
        end

        # GET singular
        def show
            reply = Reply.find(params[:id])

            payload = {
            reply: ReplyBlueprint.render_as_hash(replies),
            status: 200
            }
            render_success(payload: payload)
        end

        # POST /api/v1/
        def create
            result = Replies::Operations.new_reply(params, @current_user, @comment)
            render_error(errors: result.errors.all, status: 400) and return unless result.success?
            payload = {
            reply: ReplyBlueprint.render_as_hash(result.payload),
            status: 201
            }
            render_success(payload: payload)
        end

        def destroy
            reply = Reply.find(params[:id])

            reply.destroy
            render_success(payload: "Reply has been deleted", status:200)
        end

    end  
    end
end