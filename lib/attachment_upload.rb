module AttachmentUpload

  # Add the attachment_names to the including model
  def self.included(base)        #:nodoc:
    base.extend AttachmentUpload::ClassMethods
  end


  # for create
  def save_with_attachments
    begin 
      self.class.att_names.each { |attachment| do_attachment(attachment) }
      save!
    rescue 
      add_errors(@attachment)
    end 
  end

  # for update
  def update_with_attachments(params) 
    begin
      self.transaction do
        update_attributes(params)
        self.class.att_names.each { |attachment| do_attachment(attachment) }
        save!
      end 
    rescue 
      add_errors(@attachment)
    end 
  end

  # popuplates the Attachment.new
  def do_attachment(attachment_name)
    @attachment = Attachment.new
     # Remove the attachemnt if the checkbox is checked and there is a attachment
     eval("self.attachments.#{attachment_name}.destroy") if eval("remove_#{attachment_name} == '1' && self.attachments.#{attachment_name}") 
     
    #  If the file was submitied for upload
    if eval("uploaded_data_#{attachment_name} && uploaded_data_#{attachment_name}.size > 0")   
      # Delete the atachment if it exists
      eval("self.attachments.#{attachment_name}.destroy if self.attachments.#{attachment_name}")
      @attachment.uploaded_data = eval("uploaded_data_#{attachment_name}")
      @attachment.attachment_type = attachment_name.to_s
      # dont kow if i need this anymore
      @attachment.thumbnails.clear 
      # need to catch this exception and add it to errors
      @attachment.save!
      self.attachments << @attachment
    end
    @attachment
  end
  
  # Assigns Attachment errors to base
  def add_errors(attachment)
    if attachment.errors.on(:size) 
      errors.add_to_base("#{attachment.filename} file (#{attachment.size}) is too big (1MB max).") 
    end 
    if attachment.errors.on(:content_type) 
      errors.add_to_base("#{attachment.filename} content-type (#{attachment.content_type}) is not valid.") 
    end 
    false
  end
end