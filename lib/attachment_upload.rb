module AttachmentUpload

  def self.included(base)        #:nodoc:
    base.extend AttachmentUpload
    @@class = base
  end

  
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

  def save_with_attachments
    begin 
      @@attachment_names.each do |attachment|
        eval <<-EOS
        @attachment = Attachment.new
        if uploaded_data_#{attachment} && uploaded_data_#{attachment}.size > 0   
          self.attachments.#{attachment}.destroy if self.attachments.#{attachment}
          @attachment.uploaded_data = uploaded_data_#{attachment}
          @attachment.attachment_type = "#{attachment}"
          @attachment.thumbnails.clear 
          @attachment.save! 
          self.attachments << @attachment
        end
        EOS
        save! 
      end 
    rescue 
      add_attachment_errors(@attachment)
    end 
  end

  def update_with_attachments(params) 
    begin
      self.transaction do
        self.update_attributes(params)
        @@attachment_names.each do |attachment|
          eval <<-EOS
          @attachment = Attachment.new
          
          self.attachments.#{attachment}.destroy if remove_#{attachment} == '1' && self.attachments.#{attachment}
            
          if uploaded_data_#{attachment} && uploaded_data_#{attachment}.size > 0   
            self.attachments.#{attachment}.destroy if self.attachments.#{attachment}
            @attachment.uploaded_data = uploaded_data_#{attachment}
            @attachment.attachment_type = "#{attachment}"
            @attachment.thumbnails.clear 
            @attachment.save! 
            self.attachments << @attachment
          end
          EOS
        end
        save!
      end 
    rescue 
      add_attachment_errors(@attachment)
    end 
  end
  
  def add_attachment_errors(attachment)
    if attachment.errors.on(:size)
      errors.add_to_base("#{attachment.filename} file (#{attachment.size}) is too big (1MB max).") 
    end 
    if attachment.errors.on(:content_type) 
      errors.add_to_base("#{attachment.filename} file content-type (#{attachment.content_type}) is not valid.") 
    end
    false
  end
  
end

