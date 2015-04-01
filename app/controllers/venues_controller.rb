class VenuesController < ApplicationController
  def index
  	@venues = Venue.all - current_user.venues


    #limited search for one column
    if params[:search].present?
      @venues = Venue.where("name ilike ?", "%#{params[:search]}%")
    else
      @venues = Venue.all - current_user.venues
    end

    respond_to do |format|
      format.html{}
      format.json{ render json: @venues.map(&:name) }
      end

  end

  def show
  	@venue = Venue.find(params[:id])
  	@event = Event.all
  end
end
