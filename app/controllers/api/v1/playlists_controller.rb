module Api
    module V1
        class PlaylistsController < Api::V1::ApplicationController
            skip_before_action :authenticate, only: %i[home show]
            #playlist has a service wtih operations defined
            def create
                result = Playlists::Operations.new_playlist(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    playlist: PlaylistBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end

            def index
                playlists = Playlist.all

                payload = {
                    playlists: PlaylistBlueprint.render_as_hash(playlists),
                    status: 200
                }
                render_success(payload: payload)
            end

            def show
                playlist = Playlist.find(params[:id])
                
                payload = {
                    playlist: PlaylistBlueprint.render_as_hash(playlist),
                    status: 200
                }
                render_success(payload: payload) 
            end

            def update
                #same as in create, operations is more defined in a service
                result = Playlists::Operations.update_playlist(params)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    playlist: PlaylistBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end

            def destroy
                playlist = Playlist.find(params[:id])

                playlist.destroy
                render_success(payload: "Playlist has been deleted", status:200)
            end

            # this method displays 5 random playlist on home page
            def home
                render_success(payload: {suggested: PlaylistBlueprint.render_as_hash(Playlist.order("RANDOM()").limit(5))})
            end

        end
    end
end