class Test < ApplicationRecord
  belongs_to :category, :user
  def self.sort_tests(category)
    Test.joins(:category).where( "categories.title = ?", category ).order('tests.id DESC')
  end
end
