class User < ApplicationRecord
  def taken_tests(level)
    Test.where( "level = ?", level)
  end
end
