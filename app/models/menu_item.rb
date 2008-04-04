class MenuItem < ActiveRecord::Base
  acts_as_list :scope => :menu_section_id
  belongs_to :menu_section
end
