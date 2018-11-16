class User < ApplicationRecord
  #has_many :test_users, dependent: :destroy
  #has_many :tests, through: :test_users

  has_many :test_passages
  has_many :tests, through: :test_passages
  #has_many :author, class_name: 'Test', foreign_key: 'user_id'
  
  validates :email, format: { :with => /@/ },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  
  def taken_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
