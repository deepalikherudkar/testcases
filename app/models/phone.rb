class Phone < ActiveRecord::Base
   attr_accessible :phone_number, :author_attributes, :phone_type
   belongs_to :author
   accepts_nested_attributes_for :author
end
