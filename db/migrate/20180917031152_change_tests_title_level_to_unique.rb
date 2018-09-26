class ChangeTestsTitleLevelToUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, [:level, :title], unique: true, name: 'tests_title_level_unique_index'
  end
end
