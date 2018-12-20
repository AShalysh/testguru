class Category < ApplicationRecord
  default_scope { order(title: :asc) }
  
  has_many :tests, dependent: :nullify

  def self.translated_collection
    self.map{|cat| [cat.id, cat.translated_category]}
  end

  def translated_category
    I18n.t(title, :scope => 'category')
  end


end
