class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy_tests, -> { where(level: 0..1) }
  scope :average_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, -> (category) {
        joins(:category).where(categories: { title: category }).order(id: :desc).pluck(:title)
  }
  #def self.by_category(category)
  #  joins(:category).where(categories: { title: category }).order(id: :desc).pluck(:title)
  #end
end
