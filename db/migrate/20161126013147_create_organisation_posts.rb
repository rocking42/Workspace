class CreateOrganisationPosts < ActiveRecord::Migration
  def change
    create_table :organisation_posts do |t|
      t.text :post
      t.integer :organisation_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
