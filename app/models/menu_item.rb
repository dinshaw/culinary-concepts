class MenuItem < ActiveRecord::Base
  acts_as_list :scope => :menu_section_id
  belongs_to :menu_section
  validates_presence_of :title
end
