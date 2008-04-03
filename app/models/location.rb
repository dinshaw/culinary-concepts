class Location < ActiveRecord::Base
  acts_as_list :scope => :parent_id
  acts_as_tree
  validates_presence_of :title
end
