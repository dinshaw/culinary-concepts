class Concept < ActiveRecord::Base
  include AttachmentUpload

  acts_as_list
  validates_presence_of :title,:quote, :body
  has_many :menu_sections, :order => :position
  has_many :menu_items, :through => :menu_sections

  has_many :attachments, :as => :attachee, :dependent => :destroy do
    ['main','concept1','concept2','menu1','menu2','sidebar'].each do |type|
      class_eval <<-EOS
      def image_#{type}(reload=false)
        @image_#{type} = nil if reload
        @image_#{type} ||= find(:first, :conditions => "attachment_type = '#{type}'")
      end
      EOS
    end

  end
end
