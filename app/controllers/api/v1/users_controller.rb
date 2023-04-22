# frozen_string_literal: true

module Api
  module V1
    # Handles endpoints related to users
    class UsersController < Api::V1::ApplicationController
      skip_before_action :authenticate, only: %i[login create home show]

      def login
        result = BaseApi::Auth.login(params[:email], params[:password], @ip)
        render_error(errors: 'User not authenticated', status: 401) and return unless result.success?

        payload = {
          user: UserBlueprint.render_as_hash(result.payload[:user], view: :login),
          token: TokenBlueprint.render_as_hash(result.payload[:token]),
          status: 200
        }
        render_success(payload: payload)
      end

      def logout
        result = BaseApi::Auth.logout(@current_user, @token)
        render_error(errors: 'There was a problem logging out', status: 401) and return unless result.success?

        render_success(payload: 'You have been logged out', status: 200)
      end

      def create
        result = BaseApi::Users.new_user(params)
        render_error(errors: 'There was a problem creating a new user', status: 400) and return unless result.success?
        payload = {
          user: UserBlueprint.render_as_hash(result.payload, view: :normal)
        }
        #  TODO: Invite user to accept invitation via registered email
        render_success(payload: payload, status: 201)
      end

      def me
        render_success(payload: {user: UserBlueprint.render_as_hash(@current_user)}, status: 200)
      end

      def home
        render_success(payload: {suggested: UserBlueprint.render_as_hash(User.order("RANDOM()").limit(5))})
      end

      def show
        user = User.find(params[:id]) #change back to :username if ID doesnt work for update
        render_success(payload: {user: UserBlueprint.render_as_hash(user, view: :profile)})
      end

      def edit
        user = User.find(id: params[:id])
      end

      def update
        user = User.find(params[:id]) #change this back to :username if by id doesnt work
        user.update(user_params)
      end

      def validate_invitation
        user = User.invite_token_is(params[:invitation_token]).invite_not_expired.first

        render_error(errors: { validated: false, status: 401 }) and return if user.nil?
        render_success(payload: { validated: true, status: 200 })
      end

      private

      def user_params
        params.require(:user).permit(
          :username,
          :first_name,
          :last_name,
          :avatar
        )
      end
    end
  end
end
