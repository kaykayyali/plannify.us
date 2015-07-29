class VendorsController < ApplicationController
	def show
		@organizers = User.where(role: "organizer")
		@events = Event.all
		render 'show'
	end
	def index
		@organizers = User.where(role: "organizer")
		@events = Event.all
		render 'index'
	end
	def examine_event
		@event = Event.find_by(:id => params[:id])
		render 'examineevent'
		
	end
	def examine_organizer
		@event = Event.find_by(:id => params[:id])
		render 'examineorganizer'
		
	end



end
