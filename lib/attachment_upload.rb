module AttachmentUpload
  
  attr_accessor :uploaded_data_img_main, :uploaded_data_img_concept1, :uploaded_data_img_concept2, :uploaded_data_img_menu1, :uploaded_data_img_menu2, :uploaded_data_img_sidebar, :uploaded_data_img_manager

  def save_with_attachments
    # begin 
      self.transaction do 
        do_all_updates
        save! 
      end 
    # rescue 
    #       if @attachment.errors.on(:size) 
    #         errors.add_to_base("Uploaded file is too big (3MB max).") 
    #       end 
    #       if @attachment.errors.on(:content_type) 
    #         errors.add_to_base("Uploaded image content-type is not valid.") 
    #       end 
    #       false 
    #     end 
  end

  def update_with_attachments(params) 
    # begin
      self.transaction do
        self.update_attributes(params)
        do_all_updates
        save!
      end 
    # rescue 
    #      if @attachment.errors.on(:size) 
    #        errors.add_to_base("Uploaded file is too big (3MB max).") 
    #      end 
    #      if @attachment.errors.on(:content_type) 
    #        errors.add_to_base("Uploaded file content-type is not valid.") 
    #      end 
    #      false 
    #    end 
  end

  def do_all_updates
    update_attachment_details("img_main") if uploaded_data_img_main && uploaded_data_img_main.size > 0 
    update_attachment_details("img_concept1") if uploaded_data_img_concept1 && uploaded_data_img_concept1.size > 0 
    update_attachment_details("img_concept2") if uploaded_data_img_concept2 && uploaded_data_img_concept2.size > 0 
    update_attachment_details("img_menu1") if uploaded_data_img_menu1 && uploaded_data_img_menu1.size > 0 
    update_attachment_details("img_menu2") if uploaded_data_img_menu2 && uploaded_data_img_menu2.size > 0
    update_attachment_details("img_sidebar") if uploaded_data_img_sidebar && uploaded_data_img_sidebar.size > 0
    update_attachment_details("img_manager") if uploaded_data_img_manager && uploaded_data_img_manager.size > 0
  end
  
  def update_attachment_details(attachment_type)
    @attachment = Attachment.new
    eval("self.attachments.#{attachment_type}.destroy") if eval("self.attachments.#{attachment_type}")
    @attachment.uploaded_data = eval("uploaded_data_#{attachment_type}")
    @attachment.attachment_type = attachment_type          
    @attachment.thumbnails.clear 
    @attachment.save! 
    self.attachments << @attachment
  end

end