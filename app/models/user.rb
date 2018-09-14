class User < ApplicationRecord
  has_many :test_users, dependent: :destroy
  has_many :tests, through: :test_users

  def taken_tests(level)
    tests.where(level: level)
  end
end
