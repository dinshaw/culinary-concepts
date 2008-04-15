# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def nav_image_path(nav,page)
    "nav/#{nav}/#{page}-#{nav_img_suffix(page)}.gif"
  end

  def nav_img_suffix(page)
    page = @controller.action_name == page || @controller.controller_name == page ? "on" : "off"  
  end

  def nav_image_for(nav,page)
    image_path_string = image_tag nav_image_path(nav,page), :alt => ""
    # concepts is actaully not a link, jsut the sub nav is links
    link_to_unless( (nav_img_suffix(page) == "on" || page == "concepts"), image_path_string, eval("#{page}_path") ) rescue image_path_string
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

  def confirm_text
    "Are you sure you want to delete this?  Action cannot be reversed."
  end

  def slideshow_xml

    if @controller.controller_name == "articles"
      file_name = "home.xml"
    else
      file_name = "#{@controller.action_name}.xml"
    end
    file_name
  end

  # Meta tag stuff
  def page_title 
    title = @page_title ? "| #{@page_title}" : '' 
    %(<title>Culinary Concepts #{title}</title>) 
  end 

  def meta(name, content) 
    %(<meta name="#{name}" content="#{content}" />) 
  end

  def meta_description
    if @article and !@article.new_record?  
      "Culinary Concepts Press: #{@article.title}"
    else
      @meta_description || "Culinary Concepts of Jean-Georges" 
    end
  end

  def meta_keywords 
    if @meta_keywords
      @meta_keywords
    elsif @article and !@article.new_record?  
      [@article.title, @article.publication_name, @article.date_published.to_s(:month_year)].join(',') 
    else
      ["Culinary Concepts", "Jean-Georges"].join(',') 
    end 
  end 

end
