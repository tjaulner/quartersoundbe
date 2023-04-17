class AddUserToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :user_id, :bigint
  end
end
