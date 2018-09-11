class User < ApplicationRecord
  has_many :test_users
  has_many :tests, through: :test_users
  has_many :tests

  def taken_tests(level)
    tests.where(level: level)
  end
end
