class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.integer :profile_id
      t.string :display_text
    end
  end
end
