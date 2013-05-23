class Author < ActiveRecord::Base
  has_many :books
  has_many :phones
  attr_accessible :name,:phones_attributes,:created_at, :updated_at
  accepts_nested_attributes_for :phones

  validates :name, :presence => true, :uniqueness => true, :allow_blank => false
end

