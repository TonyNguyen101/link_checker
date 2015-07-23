class LinksWorker	
	include Sidekiq::Worker 

	def perform(link_id)
		link = Link.find(link_id)
		request = Typhoeus.get(link.href, followlocation: true)
		link.update_attribute(:response_code, request.response_code)
	end
end
