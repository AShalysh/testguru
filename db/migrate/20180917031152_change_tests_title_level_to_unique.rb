class ChangeTestsTitleLevelToUnique < ActiveRecord::Migration[5.2]
  def change
  	add_index :tests, [:title, :level], unique: true, name: 'tests_title_level_unique_index'
  end
end
