class ConceptsController < ApplicationController

  # GET /concepts/1
  # GET /concepts/1.xml
  def show
    @concept = Concept.find(params[:id])
    @image_type = "concept"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @concept }
    end
  end
  
  def quote
    @image_type = "start"    
    @concept = Concept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @concept }
    end
  end
  


end
