class Location < ActiveRecord::Base
  acts_as_list
  acts_as_tree
  validates_presence_of :title
end
