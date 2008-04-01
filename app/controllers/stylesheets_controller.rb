class StylesheetsController < ApplicationController
  #caches_page :layout, :main
  skip_before_filter :login_required
  
  layout false

  before_filter :do_colors
  
  def do_colors
    @off_white = "#e5e1d8"
    @masthead_red = "#600d00"
    @bg_red = "#6f1100"
    @content_red = "#510a00"
    @salmon = "#a2766c"
  end
  
  def main
    respond_to do |format|
      format.css do 
        render
      end # end format.css
    end
  end

  def layout
    respond_to do |format|
      format.css do 
        render
      end # end format.css
    end
  end
end
