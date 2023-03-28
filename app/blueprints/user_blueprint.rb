# frozen_string_literal: true

# Defines the JSON blueprint for the User model
class UserBlueprint < Blueprinter::Base
  identifier :id
  fields :first_name, :last_name, :name, :email, :username

  view :login do
    association :token, blueprint: TokenBlueprint do |user, _options|
      user.tokens.last
    end
  end

  view :normal do
    fields :first_name, :last_name, :name, :email, :phone
  end

  #adding view for profile to see playlists (?) 03/27/23
  view :profile do
    fields :playlists
  end

end

