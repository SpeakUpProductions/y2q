class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.integer :profile_id
      t.string :name
      t.string :website
      t.integer :org_type
    end
  end
end
