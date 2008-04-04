class MenuSectionsController < ApplicationController

  # GET /menu_sections/1
  # GET /menu_sections/1.xml
  def show
    @menu_section = MenuSection.find(params[:id])
    @concept = @menu_section.concept
    @image_type = "menu"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_section }
    end
  end

end
