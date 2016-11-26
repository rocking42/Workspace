class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :type

      t.timestamps null: false
    end
  end
end
