class Article < ActiveRecord::Base
  acts_as_list
  validates_presence_of :title, :body, :publication_name, :date_published
  acts_as_state_machine :initial => :active
  state :active
  
end
