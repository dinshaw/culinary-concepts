class LocationsController < ApplicationController
  include ListMethods
  # GET /locations
  # GET /locations.xml
  def index
    @locations = Location.find(:all, :conditions => "parent_id is null", :order => :position)
    @united_states = Location.find(5)
    @international = Location.find(16)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

end
