class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def blog
  	redirect_to "http://harvestprofit.herokuapp.com/blog#{request.fullpath.gsub('/blog','')}", :status => :moved_permanently
  	#redirect_to "http://localhost:3000/blog#{request.fullpath.gsub('/blog','')}", :status => :moved_permanently
  end
end
