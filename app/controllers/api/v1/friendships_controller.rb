module Api
    module V1
      class FriendshipsController < Api::V1::ApplicationController
        skip_before_action :authenticate, only: %i[show index]

        #get all
        def index
            friendships = Friendship.all
            payload = {
                friendships: FriendshipBlueprint.render_as_hash(posts),
                status: 200
              }
              render_success(payload: payload)
        end

        # GET singular
        def show
            friendship = Friendship.find(params[:id])

            payload = {
            friendship: FriendshipBlueprint.render_as_hash(like),
            status: 200
            }
            render_success(payload: payload)
        end

        # POST /api/v1/posts
        def create
            result = Friendships::Operations.new_friendship(params, @current_user)
            render_error(errors: result.errors.all, status: 400) and return unless result.success?
            payload = {
            friendship: FriendshipBlueprint.render_as_hash(result.payload),
            status: 201
            }
            render_success(payload: payload)
        end

        def destroy
            friendship = Friendship.find(params[:id])

            friendship.destroy
            render_success(payload: "Friendship has been deleted", status:200)
        end

    end  
    end
end