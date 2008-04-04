class Location < ActiveRecord::Base
  acts_as_list :scope => :parent_id, :order => :position
  acts_as_tree :order => :position
  validates_presence_of :title
end
