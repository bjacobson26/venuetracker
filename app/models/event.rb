class Event < ActiveRecord::Base
	belongs_to :venue



	def events_api
		#make empty array
		id_array = []
		
		venues = Venue.all 
		venues.each do |v|
			id_array.push(v.ext_id)
	  end #push id's to array

		puts "id_array count: #{id_array.count}"

		x = 0
		puts "before while loop: x = #{x}"
		    

				while x <= 50 do
					puts "GOING IN: X = #{x}"

				response = HTTParty.get("http://api.songkick.com/api/3.0/venues/#{id_array[x]}/calendar.json?apikey=#{ENV['SK_API_KEY']}")
				puts "response sent"
				puts "the id number is: #{id_array[x]}"
				response_json = JSON.parse(response.to_json)
				puts "response recived and turned into JSON"
				
				events = response_json["resultsPage"]["results"]["event"]
				puts "Events = narrowed down response_json"
				

				if events != nil
					events.each do |ev|
						e = Event.new

						puts "GOING THROUGH THE LOOP AND X = #{x}!"

						puts "NAMES___________________"
						puts ev["displayName"]
						e.name = ev["displayName"]
						
						puts "DATE____________________"
						e.date = ev["start"]["date"]
						puts ev["start"]["date"]

						puts "TIME____________________"
						e.time = ev["start"]["time"]
						puts ev["start"]["time"]


						puts "DATETIME____________________"
						e.datetime = ev["datetime"]
						puts ev["start"]["datetime"]
					
						# puts "ARTIST____________________"
						# e.artist = ev["performance"][0]["displayName"]
						# puts ev["performance"][0]["displayName"]
				
						puts "URI____________________"
						e.uri = ev["uri"]
						puts ev["uri"]

						puts "Ext_id ______________________"
						e.ext_id = ev["venue"]["id"]
						puts ev["venue"]["id"]
					
						e.save
						puts "SAVED IN DATABASE"
						puts "MADE IT THROUGH THE LOOP!"
						puts "****************************************************"
					end
					x += 1
						puts "#{x}"
					else
						puts "VENUE ERROR: SKIPPED #{id_array[x]}"
						x +=1
						puts "#{x}"

					end
				end
	

					
	end


end
