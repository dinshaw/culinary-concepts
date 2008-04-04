class Article < ActiveRecord::Base
  acts_as_list
  acts_as_state_machine :initial => :active
  state :active
end
