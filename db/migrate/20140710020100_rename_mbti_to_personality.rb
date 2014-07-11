class RenameMbtiToPersonality < ActiveRecord::Migration
  def change
    rename_column :profiles, :MBTI, :personality
  end
end
