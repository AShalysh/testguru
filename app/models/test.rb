class Test < ApplicationRecord
  belongs_to :category
  has_many :test_users
  has_many :users, through: :test_users

  def self.by_category(category)
    joins(:category).where(categories: { title: category }).order(id: :desc).pluck(:title)
  end
end
