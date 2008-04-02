# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    
  def nav_image_path(nav,page)
    "nav/#{nav}/#{page}-#{nav_img_suffix(page)}.gif"
  end
  
  def nav_img_suffix(page)
    page = @controller.action_name == page ? "on" : "off" 
  end
end
