class MenuSectionsController < ApplicationController
  # GET /menu_sections
  # GET /menu_sections.xml
  def index
    @menu_sections = MenuSection.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_sections }
    end
  end

  # GET /menu_sections/1
  # GET /menu_sections/1.xml
  def show
    @menu_section = MenuSection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_section }
    end
  end

end
