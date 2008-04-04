class Manager < ActiveRecord::Base
  acts_as_list
  validates_presence_of :name,:body
  belongs_to :location
end
