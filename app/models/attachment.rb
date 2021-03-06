class Attachment < ActiveRecord::Base
  belongs_to :attachee, :polymorphic => true
  
  acts_as_list :scope => 'attachee_id=\'#{attachee_id}\' AND attachee_type=\'#{attachee_type}\''
  
  has_attachment :content_type => ['application/pdf', :image],
#                  :processor => :rmagick,
                  :max_size => 3.megabyte,
                  :storage => :file_system, 
                  :path_prefix => 'public/attachments',
                  :resize_to => '800x800>',
                  :thumbnails => {:concept => '469x666>', :sidebar => '236x666>', :square => '241x241>', :thumb => 'x150>' }
                  
  validates_as_attachment
  
end
