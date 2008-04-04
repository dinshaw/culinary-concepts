class MenuSection < ActiveRecord::Base
  acts_as_list :scope => :concept_id
  belongs_to :concept
  has_many :menu_items, :order => :position
end
