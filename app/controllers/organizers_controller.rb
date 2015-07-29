class OrganizersController < ApplicationController
	before_action(:authenticate_user!)
	before_action :ensure_organizer
	def index
		@vendors = User.where(:role => 'vendor')
		@events = current_user.events
		render 'index'
	end

	def show
		@organizer = User.find_by(:id => params[:id])
		render 'show'
	end

	def new
		
		render 'new'

	end
	def event_delete
		event = Event.find_by(:id => params[:id])
		if event.user_id == current_user.id
			event.destroy
		else
			redirect_to :back
		end
		
		redirect_to organizer_path
		
	end

	def create
		event = current_user.events.new()
		event.name = params[:event]["name"]
		event.venue = params[:event]["venue"]
		event.zipcode = params[:event]["zipcode"]
		event.city = params[:event]["city"]
		event.state = params[:event]["state"]
		event.address = params[:event]["address"]
		
		event.start_date = datetime_builder(params[:event]["start_date"],params[:event]["start_time"])	
		event.end_date = datetime_builder(params[:event]["end_date"], params[:event]["end_time"])	
		

		if event.save
			
			redirect_to organizer_path
		else
			redirect_to organizers_addevent_path
		end
	end

	def event_show
		event = Event.find_by(:id => params[:id])
		if event.user_id == current_user.id
			@event = event
			render 'showEvent'
		else 
			redirect_to '/'
		end
		
	end
	def examine_vendor
		@vendor = User.find_by(:id => params[:id])
		render 'examinevendor'
	end

	private

	def ensure_organizer
		unless current_user.role == "organizer"
			redirect_to '/'
		end
	end

		def event_params
		params.require(:event).permit(:name, :start_date, :venue, :address, :zipcode, :city, :state, :start_time, :end_time, :end_time)
	end
	def datetime_builder(date,time)
		if date.present? && time.present?
			parse_date = Date.parse(date)
			parse_time = Time.parse(time)
			return DateTime.new(parse_date.year, parse_date.month, parse_date.day, parse_time.hour, parse_time.min)
		else 
			return DateTime.now
		end
	end
end
