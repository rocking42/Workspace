class CreateGroupPosts < ActiveRecord::Migration
  def change
    create_table :group_posts do |t|
      t.text :post
      t.integer :user_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
