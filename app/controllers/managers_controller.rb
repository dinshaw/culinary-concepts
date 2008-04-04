class ManagersController < ApplicationController
  # GET /managers
  # GET /managers.xml
  def index
    @managers = Manager.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @managers }
    end
  end

  # GET /managers/1
  # GET /managers/1.xml
  def show
    @manager = Manager.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @manager }
    end
  end
end
