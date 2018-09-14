class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users
  #alias_attribute :user, :author

  def self.by_category(category)
    joins(:category).where(categories: { title: category }).order(id: :desc).pluck(:title)
  end
end
