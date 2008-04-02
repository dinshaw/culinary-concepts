# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    
  def nav_image_path(nav,page)
    "nav/#{nav}/#{page}-#{nav_img_suffix(page)}.gif"
  end
  
  def nav_img_suffix(page)
    page = @controller.action_name == page ? "on" : "off" 
  end
  
  def nav_image_for(nav,page)
    image_path_string = image_tag nav_image_path(nav,page), :alt => ""
    link_to_unless(nav_img_suffix(page) == "on", image_path_string, eval("#{page}_path") ) rescue image_path_string
  end
end
