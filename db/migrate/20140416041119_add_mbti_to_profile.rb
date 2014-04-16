class AddMbtiToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :MBTI, :string
  end
end
