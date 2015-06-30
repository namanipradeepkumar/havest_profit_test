class PagesController < ApplicationController

  def home
    @title = Array.new
    @description = Array.new
    @image = Array.new
    @link = Array.new
    require 'nokogiri'
    require 'open-uri'
     url="http://harvestprofit.flywheelsites.com/hexahost.com/blogs/?feed=rss2"
    @doc = Nokogiri::XML(open(url,:http_basic_authentication => ['flywheel', 'melted-juice'] ))
   

          @doc.xpath("//item").each do |node|
          
        node.css("title").each do |f|  # title or whatever else you want
          @title << f.inner_html

        end

        node.css("description").each do |f|  # title or whatever else you want
          @description << f.inner_html

        end

        node.css("link").each do |f|  # title or whatever else you want
          @link << f.inner_html

        end
       
        p "......................"
         image = node.xpath("//content:encoded").text
         doc = Nokogiri::HTML( image)
  @image << doc.css('img').map{ |i| i['src'] } # Array of strings

        #p @image[0][0]
        #p @image
        #p @image.css('img').map{ |i| i['src'] }
        # node.css("content:encoded").each do |f|  # title or whatever else you want
        #  p f.inner_html
        #  p ".................."
        # end
      end
      #p @image[0] = @image[0].css('img').map{ |i| i['src'] }
      #p @image[0]
      p @link
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
