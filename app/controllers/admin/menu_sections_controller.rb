# list method couldn't handle the deeply nested rout so i just reopended it and overrode it
module ListMethods
  def up
    MenuSection.find(params[:id]).move_higher
    redirect_to admin_concept_menu_sections_url(@concept)
  end

  def down
    MenuSection.find(params[:id]).move_lower
    redirect_to admin_concept_menu_sections_url(@concept)
  end
end


class Admin::MenuSectionsController < AdminController
  # GET /menu_sections
  # GET /menu_sections.xml
  before_filter :get_concept

  def get_concept
    @concept = Concept.find(params[:concept_id])
  end

  def index
    @menu_sections = @concept.menu_sections

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_sections }
    end
  end

  # GET /menu_sections/1
  # GET /menu_sections/1.xml
  def show
    @menu_section = @concept.menu_sections.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_section }
    end
  end

  # GET /menu_sections/new
  # GET /menu_sections/new.xml
  def new
    @menu_section = @concept.menu_sections.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_section }
    end
  end

  # GET /menu_sections/1/edit
  def edit
    @menu_section = @concept.menu_sections.find(params[:id])
  end

  # POST /menu_sections
  # POST /menu_sections.xml
  def create
    @menu_section = @concept.menu_sections.new(params[:menu_section])

    respond_to do |format|
      if @menu_section.save
        flash[:notice] = 'Menu Section was successfully created.'
        format.html { redirect_to admin_concept_menu_sections_url(@concept) }
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
        flash[:notice] = 'Menu Section was successfully updated.'
        format.html { redirect_to admin_concept_menu_sections_url(@concept) }
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
      format.html { redirect_to admin_concept_menu_sections_url(@concept) }
      format.xml  { head :ok }
    end
  end

end
