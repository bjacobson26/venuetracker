class EventsController < ApplicationController
  def index
  	@events = Event.all

    if params[:search].present?
      @events = Event.where("name ilike ?", "%#{params[:search]}%")
    else
      @events = Event.all
    end

    respond_to do |format|
      format.html{}
      format.json{ render json: @events.map(&:name) }
    end



  end

  


end
