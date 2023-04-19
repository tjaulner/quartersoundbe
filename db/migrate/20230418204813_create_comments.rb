class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.bigint :user_id
      t.string :body
      t.integer :parent_id
      t.integer :post_id

      t.timestamps
    end
  end
end
