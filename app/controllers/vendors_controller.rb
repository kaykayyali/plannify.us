class VendorsController < ApplicationController
	def show
		@organizers = User.where(role: "organizer")
		@events = Event.all
		render 'show'
	end




end
