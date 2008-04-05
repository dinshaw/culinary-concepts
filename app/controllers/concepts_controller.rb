class ConceptsController < ApplicationController
  before_filter :do_colors
  # GET /concepts/1
  # GET /concepts/1.xml
  def show
    @concept = Concept.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @concept }
    end
  end
  
  def quote  
    @concept = Concept.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @concept }
    end
  end
  


end
