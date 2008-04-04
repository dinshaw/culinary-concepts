class Manager < ActiveRecord::Base
  include AttachmentUpload
  
  acts_as_list
  validates_presence_of :name,:body
  belongs_to :location
  
  has_many :attachments, :as => :attachee, :dependent => :destroy do
    ['img_manager'].each do |type|
      class_eval <<-EOS
      def #{type}(reload=false)
        @#{type} = nil if reload
        @#{type} ||= find(:first, :conditions => "attachment_type = '#{type}'")
      end
      EOS
    end
  end
  
  def photo
    attachments.img_manager
  end
end
