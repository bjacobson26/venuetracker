
class Venue < ActiveRecord::Base
	has_many :events
	has_many :user_venues
	has_many :users, through: :user_venues
	

	# gets venue data from songkick API 
	def save_data_from_api
		response = HTTParty.get("http://api.songkick.com/api/3.0/search/venues.json?query=los%20angeles&apikey=#{ENV['SK_API_KEY']}")
			response_json = JSON.parse(response.to_json)
			venues = response_json["resultsPage"]["results"]["venue"]
			
			venues.each do |venue|
         # puts venue["website"]
         v = Venue.new
         v.ext_id = venue["id"]
         v.name = venue["displayName"]
         v.city = venue["metroArea"]["displayName"]
         v.website = venue["website"]
         v.address = venue["street"]
         v.phone = venue["phone"]
         v.save
			end	
	end
end
