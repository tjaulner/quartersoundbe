module Api
  module V1
    class TracksController < Api::V1::ApplicationController
      skip_before_action :authenticate, only: %i[show index]

      # GET all
      def index
        tracks = Track.all

        payload = {
          tracks: TrackBlueprint.render_as_hash(tracks),
          status: 200
        }
        render_success(payload: payload)
        
      end

      # GET singular
      def show
        track = Track.find(params[:id])

        payload = {
          tracks: TrackBlueprint.render_as_hash(tracks),
          status: 200
        }
        render_success(payload: payload)
      end

      # POST /api/v1/tracks
      def create
        #@track.current_playlist = current_playlist.id;
        result = Tracks::Operations.new_track(params, @current_user)
        render_error(errors: result.errors.all, status: 400) and return unless result.success?
        payload = {
          track: TrackBlueprint.render_as_hash(result.payload),
          status: 201
        }
        render_success(payload: payload)
      end

      # DELETE 
      def destroy
        track = Track.find(params[:id])

        track.destroy
        render_success(payload: "Track has been deleted", status:200)
      end

      private

      def track_params
        params.require(:track).permit(:artist, :trackname, :album, :year, :genre, :play_preview_url, :album_img_url, :playlist_id, :user)
      end
      
        
    end
  end
end