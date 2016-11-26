class CreateOrganisationsUsers < ActiveRecord::Migration
  def change
    create_table :organisations_users, id: false do |t|
      t.integer :organisation_id
      t.integer :user_id
    end
  end
end
