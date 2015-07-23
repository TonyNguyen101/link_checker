class WebsitesController < ApplicationController
  def new
  	@website = Website.new
  end

  def create
  	@website = Website.new(params.require(:website).permit(:url))
  	if @website.save
  		html_doc = Nokogiri::HTML(open(@website.url))
  		anchors = html_doc.css('a')
  		link_array = []
  		
  		anchors.each do |anchor|
  			link = anchor.attr('href')
  			@link = Link.new(href: link, website_id: @website.id)
  			LinksWorker.perform_async(@link.id)
  		end

  		redirect_to websites_path		
  	else	
  		render :new	
  	end


  	
  end

  def show
  	@links = Link.all
  	binding.pry
  end
end
