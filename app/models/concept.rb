class Concept < ActiveRecord::Base
  include AttachmentUpload

  def to_param
    "#{id}-#{slug}"
  end


  acts_as_list
  validates_presence_of :title,:quote, :body
  has_many :menu_sections, :order => :position
  has_many :menu_items, :through => :menu_sections

  has_many :attachments, :as => :attachee, :dependent => :destroy do
    ['img_main','img_concept1','img_concept2','img_menu1','img_menu2','img_sidebar'].each do |type|
      class_eval <<-EOS
      def #{type}(reload=false)
        @#{type} = nil if reload
        @#{type} ||= find(:first, :conditions => "attachment_type = '#{type}'")
      end
      EOS
    end

  end
end
