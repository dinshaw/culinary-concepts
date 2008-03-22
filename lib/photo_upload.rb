module PhotoUpload
  attr_accessor :uploaded_photo_data
  attr_accessor :remove_photo
  
  def save_with_photo
    photo = Photo.new 
    begin 
      self.transaction do 
        if uploaded_photo_data && uploaded_photo_data.size > 0 
          photo.uploaded_data = uploaded_photo_data 
          photo.thumbnails.clear 
          photo.save! 
          self.photo = photo 
        end 
        save! 
      end 
    rescue 
      if photo.errors.on(:size) 
        errors.add_to_base("Uploaded image is too big (1MB max).") 
      end 
      if photo.errors.on(:content_type) 
        errors.add_to_base("Uploaded image content-type is not valid.") 
      end 
      false 
    end 
  end
  
  def update_with_photo(params) 
    photo = Photo.new 
    begin
      self.transaction do
        self.update_attributes(params)
        if remove_photo == '1'
          puts "removed"
          self.photo.destroy
        elsif uploaded_photo_data && uploaded_photo_data.size > 0   
          photo.uploaded_data = uploaded_photo_data 
          photo.thumbnails.clear 
          photo.save! 
          self.photo = photo 
        end
        save!
      end 
    rescue 
      if photo.errors.on(:size) 
        errors.add_to_base("Uploaded image is too big (1MB max).") 
      end 
      if photo.errors.on(:content_type) 
        errors.add_to_base("Uploaded image content-type is not valid.") 
      end 
      false 
    end 
  end
end