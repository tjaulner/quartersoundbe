class AddReplyToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :reply_id, :bigint
  end
end
