class Book < ActiveRecord::Base
  attr_accessible :author_attributes, :title
  belongs_to :author
  accepts_nested_attributes_for :author

  validates :title, presence: true, uniqueness: true

  def self.by_title(letter)
    where("title like (?)","#{letter}%").collect(&:title).sort
  end
end
