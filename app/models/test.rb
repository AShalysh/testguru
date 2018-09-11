class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :test_users
  has_many :users, through: :test_users

  def self.by_category(category)
    joins(:category).where(categories: { title: category }).order(id: :desc).pluck(:title)
  end
end
