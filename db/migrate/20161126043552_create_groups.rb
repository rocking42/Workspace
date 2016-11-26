class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.text :name
      t.integer :organisation_id

      t.timestamps null: false
    end
  end
end
