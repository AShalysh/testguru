class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable
  #has_many :test_users, dependent: :destroy
  #has_many :tests, through: :test_users

  has_many :test_passages
  has_many :tests, through: :test_passages
  #has_many :author, class_name: 'Test', foreign_key: 'user_id'

  def taken_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    first_name + ' ' + last_name
  end

end
