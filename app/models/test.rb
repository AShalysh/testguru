class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions, dependent: :destroy
  #has_many :test_users, dependent: :destroy
  #has_many :users, through: :test_users
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :title, uniqueness: { scope: :level }

  scope :easy_level, -> { where(level: 0..1) }

  scope :average_level, -> { where(level: 2..4) }

  scope :hard_level, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, -> (category) {
        joins(:category).where(categories: { title: category }).order(id: :desc)
  }

  def self.titles_by_category(category)
    by_category(category).pluck(:title)
  end


  #def self.by_category(category)
  #  joins(:category).where(categories: { title: category }).order(id: :desc).pluck(:title)
  #end
end
