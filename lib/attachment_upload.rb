module AttachmentUpload

  # Add the attachment_names to the including model
  def self.included(base)        #:nodoc:
    base.extend AttachmentUpload
    @@class = base
  end

  # List the different named attacments
  # add the attr_accessor for each one
  # add the named association through the has_many :attachments
  def attachment_names(*names)
    @@attachment_names = names
    has_many :attachments, :as => :attachee, :dependent => :destroy do
      names.each do |name|        
        class_eval <<-EOS
        #{@@class}.send(:attr_accessor, :uploaded_data_#{name}, :remove_#{name})
        def #{name}(reload=false)
          @#{name} = nil if reload
          @#{name} ||= find(:first, :conditions => ["attachment_type = ?",'#{name}'])
        end
        EOS
      end
    end
  end

  # for create
  def save_with_attachments
    begin 
      @@attachment_names.each { |attachment| do_attachment(attachment) }
      save!
    rescue 
      add_errors(@attachment)
    end 
  end

  # for update
  def update_with_attachments(params) 
    # begin
      self.transaction do
        update_attributes(params)
        @@attachment_names.each { |attachment| do_attachment(attachment) }
        save!
      end 
    # rescue 
    #   add_errors(@attachment)
    # end 
  end

  # popuplates the Attachment.new
  def do_attachment(attachment_name)
    @attachment = Attachment.new
     # Remove the attachemnt if the checkbox is checked and there is a attachment
     eval("self.attachments.#{attachment_name}.destroy" rescue false) if eval("remove_#{attachment_name} == '1' && self.attachments.#{attachment_name}" rescue false) 
     
    if eval("uploaded_data_#{attachment_name} && uploaded_data_#{attachment_name}.size > 0")   
      eval("self.attachments.#{attachment_name}.destroy if self.attachments.#{attachment_name}")
      @attachment.uploaded_data = eval("uploaded_data_#{attachment_name}")
      @attachment.attachment_type = attachment_name.to_s
      @attachment.thumbnails.clear 
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