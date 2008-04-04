class Concept < ActiveRecord::Base
  acts_as_list
  validates_presence_of :title,:quote, :body
  
end
