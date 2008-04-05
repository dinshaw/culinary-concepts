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
    link_to_unless(nav_img_suffix(page) == "on"  || page == "concepts", image_path_string, eval("#{page}_path") ) rescue image_path_string
  end
  
  def do_colors
     @off_white = "#e5e1d8"
     @masthead_red = "#600d00"
     @bg_red = "#6f1100"
     @content_red = "#510a00"
     @salmon = "#a2766c"
     @brown = "#b4683b"
     @light_red = "#CD5C5C"
     @pink = "#fdca90"
   end
end
