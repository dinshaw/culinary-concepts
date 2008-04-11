class Concept < ActiveRecord::Base
  include AttachmentUpload

  def to_param
    "#{id}-#{slug}"
  end

  acts_as_list
  validates_presence_of :title,:quote, :body
  has_many :menu_sections, :order => :position
  has_many :menu_items, :through => :menu_sections

  attachment_names :img_main,:img_concept1,:img_concept2,:img_menu1,:img_menu2,:img_sidebar,:img_signature
  
  # override for now
  def bg_color
    "#fdca90"
  end
  
end
