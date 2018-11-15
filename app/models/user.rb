require 'digest/sha1'

class User < ApplicationRecord
  #has_many :test_users, dependent: :destroy
  #has_many :tests, through: :test_users
  #include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  #has_many :author, class_name: 'Test', foreign_key: 'user_id'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  def taken_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    #test_passages.order(id: :desc).find_by(test_id: test.id)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
