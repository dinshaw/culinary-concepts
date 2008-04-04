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

  # GET /menu_sections/new
  # GET /menu_sections/new.xml
  def new
    @menu_section = MenuSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_section }
    end
  end

  # GET /menu_sections/1/edit
  def edit
    @menu_section = MenuSection.find(params[:id])
  end

  # POST /menu_sections
  # POST /menu_sections.xml
  def create
    @menu_section = MenuSection.new(params[:menu_section])

    respond_to do |format|
      if @menu_section.save
        flash[:notice] = 'MenuSection was successfully created.'
        format.html { redirect_to(@menu_section) }
        format.xml  { render :xml => @menu_section, :status => :created, :location => @menu_section }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menu_sections/1
  # PUT /menu_sections/1.xml
  def update
    @menu_section = MenuSection.find(params[:id])

    respond_to do |format|
      if @menu_section.update_attributes(params[:menu_section])
        flash[:notice] = 'MenuSection was successfully updated.'
        format.html { redirect_to(@menu_section) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_sections/1
  # DELETE /menu_sections/1.xml
  def destroy
    @menu_section = MenuSection.find(params[:id])
    @menu_section.destroy

    respond_to do |format|
      format.html { redirect_to(menu_sections_url) }
      format.xml  { head :ok }
    end
  end
end
