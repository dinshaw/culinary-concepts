class Manager < ActiveRecord::Base
  include AttachmentUpload
  
  acts_as_list
  validates_presence_of :name,:body
  belongs_to :location
  
  attachment_names :img_manager
  
  def photo
    attachments.img_manager
  end
end
