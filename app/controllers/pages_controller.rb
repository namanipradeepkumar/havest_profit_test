class PagesController < ApplicationController

  def home
    if user_signed_in?
  		redirect_to dashboard_path
    end
  end

  def dashboard
  	render :layout => 'dashboard_layout'
  end

  def field
  	render :layout => 'dashboard_layout'
  	@fields = Field.all

  end

end
