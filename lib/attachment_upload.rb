module AttachmentUpload
  attr_accessor :uploaded_data_main, :uploaded_data_concept1, :uploaded_data_concept2, :uploaded_data_menu1, :uploaded_data_menu2, :uploaded_data_sidebar

  def save_with_attachments
    begin 
      self.transaction do 
        do_all_updates
        save! 
      end 
    rescue 
      if tout_image.errors.on(:size) 
        errors.add_to_base("Uploaded file is too big (3MB max).") 
      end 
      if tout_image.errors.on(:content_type) 
        errors.add_to_base("Uploaded image content-type is not valid.") 
      end 
      false 
    end 
  end

  def update_with_attachments(params) 
    begin
      self.transaction do
        self.update_attributes(params)
        do_all_updates
        save!
      end 
    rescue 
      if attachment.errors.on(:size) 
        errors.add_to_base("Uploaded file is too big (3MB max).") 
      end 
      if attachment.errors.on(:content_type) 
        errors.add_to_base("Uploaded file content-type is not valid.") 
      end 
      false 
    end 
  end

  def do_all_updates
    update_attachment_details("main") if uploaded_data_main && uploaded_data_main.size > 0 
    update_attachment_details("concept1") if uploaded_data_concept1 && uploaded_data_concept1.size > 0 
    update_attachment_details("concept2") if uploaded_data_concept2 && uploaded_data_concept2.size > 0 
    update_attachment_details("menu1") if uploaded_data_menu1 && uploaded_data_menu1.size > 0 
    update_attachment_details("menu2") if uploaded_data_menu2 && uploaded_data_menu2.size > 0
    update_attachment_details("sidebar") if uploaded_data_menu2 && uploaded_data_menu2.size > 0
  end
  
  def update_attachment_details(type)
    image = Attachment.new
    eval("self.attachments.image_#{type}.destroy") if eval("self.attachments.image_#{type}")
    image.uploaded_data = eval("uploaded_data_#{type}")
    image.attachment_type = type          
    image.thumbnails.clear 
    image.save! 
    self.attachments << image
  end

end