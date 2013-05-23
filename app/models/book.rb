class Book < ActiveRecord::Base
  attr_accessible :author_attributes, :title,:published
  belongs_to :author
  accepts_nested_attributes_for :author

  validates :title, presence: true, uniqueness: true

  def self.by_title(letter)
    where("title like (?)","#{letter}%").collect(&:title).sort
  end

  def update_status(val)
    update_attribute(:published, val)
  end

end
