class UserVenuesController < ApplicationController 

	def create 
		if current_user != nil 
			@user_venue = UserVenue.new(venue_id: params[:venue_id])
			@user_venue.user_id = current_user.id 
			if @user_venue.save
				redirect_to venues_path
			end
		end
	end

	def destroy
		UserVenue.where(id: params[:id]).first.destroy
			redirect_to user_venues_path
	end
end