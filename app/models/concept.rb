class Concept < ActiveRecord::Base
  acts_as_list
  validates_presence_of :title,:quote, :body
  has_many :menu_sections, :order => :position
  has_many :menu_items, :through => :menu_sections
  
end
