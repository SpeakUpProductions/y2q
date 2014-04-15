class CreateHeartbreaks < ActiveRecord::Migration
  def change
    create_table :heartbreaks do |t|
      t.string :display

      t.timestamps
    end
  end
end
