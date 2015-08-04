class VendorsController < ApplicationController
	before_action(:authenticate_user!)
	# def show
	# 	@organizers = User.where(role: "organizer")
	# 	@events = Event.all
	# 	render 'show'
	# end
	def index
		@vendors = User.where(:role => 'vendor')
		date = Date.parse(params[:date])
		searchDate = DateTime.new(date.year, date.month, date.day)
		@events = current_user.events.where('start_date BETWEEN ? AND ?', searchDate.beginning_of_day, searchDate.end_of_day).all
		
		render 'index'
	end
	def examine_event
		@event = Event.find_by(:id => params[:id])
		@organizer = User.find_by(:id => @event.user_id)
		render 'examineevent'
	end
	



end
