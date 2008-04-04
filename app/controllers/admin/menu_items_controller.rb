# list method couldn't handle the deeply nested rout so i just reopended it and overrode it
module ListMethods
  def up
    MenuItem.find(params[:id]).move_higher
    redirect_to admin_concept_menu_section_menu_items_url(@menu_section.concept, @menu_section)
  end

  def down
    MenuItem.find(params[:id]).move_lower
    redirect_to admin_concept_menu_section_menu_items_url(@menu_section.concept, @menu_section)
  end
end


class Admin::MenuItemsController < AdminController
  
  before_filter :get_menu_section
  
  def get_menu_section
    @menu_section = MenuSection.find(params[:menu_section_id])
  end
  
  # GET /menu_items
  # GET /menu_items.xml
  def index
    @menu_items = @menu_section.menu_items

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_items }
    end
  end

  # GET /menu_items/1
  # GET /menu_items/1.xml
  def show
    @menu_item = MenuItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  # GET /menu_items/new
  # GET /menu_items/new.xml
  def new
    @menu_item = MenuItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  # GET /menu_items/1/edit
  def edit
    @menu_item = @menu_section.menu_items.find(params[:id])
  end

  # POST /menu_items
  # POST /menu_items.xml
  def create
    @menu_item = @menu_section.menu_items.new(params[:menu_item])

    respond_to do |format|
      if @menu_item.save
        flash[:notice] = 'MenuItem was successfully created.'
        format.html { redirect_to admin_concept_menu_section_menu_items_path(@menu_section.concept, @menu_section ) }
        format.xml  { render :xml => @menu_item, :status => :created, :location => @menu_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menu_items/1
  # PUT /menu_items/1.xml
  def update
    @menu_item = @menu_section.menu_items.find(params[:id])

    respond_to do |format|
      if @menu_item.update_attributes(params[:menu_item])
        flash[:notice] = 'MenuItem was successfully updated.'
        format.html { redirect_to admin_concept_menu_section_menu_items_path(@menu_section.concept, @menu_section )  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.xml
  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    respond_to do |format|
      format.html { redirect_to(admin_concept_menu_section_menu_items_path(@menu_section.concept, @menu_section ) ) }
      format.xml  { head :ok }
    end
  end
  
end
