class OrganizersController < ApplicationController
	before_action(:authenticate_user!)
	before_action :ensure_organizer
	def index
		@vendors = User.where(:role => 'vendor')
		date = Date.parse(params[:date])
		searchDate = DateTime.new(date.year, date.month, date.day)
		@events = current_user.events.where('start_date BETWEEN ? AND ?', searchDate.beginning_of_day, searchDate.end_of_day).all
		@date = date
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
		
		# redirect_to organizer_path
		render json: {response: event.id},  status: 200 
	end

	def create
		event = current_user.events.new()
		event.name = params[:event]["name"]
		event.venue = params[:event]["venue"]
		event.zipcode = params[:event]["zipcode"]
		event.city = params[:event]["city"]
		event.state = params[:event]["state"]
		address = params[:event]["address"].split(',')
		event.address = address[0]
		event.guestcount = params[:event]["guestcount"]
		
		event.start_date = datetime_builder(params[:event]["start_date"],params[:event]["start_time"])	
		event.end_date = datetime_builder(params[:event]["end_date"], params[:event]["end_time"])	
		

		if event.save
			
			redirect_to calendar_path
		else
			flash[:alert] = "Please fill in the required paths."
			redirect_to organizers_addevent_path
		end
	end

	def event_show
		event = Event.find_by(:id => params[:id])
		if event.user_id == current_user.id
			@event = event
			@vendors = User.where(:role => "vendor")
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
		params.require(:event).permit(:name, :start_date, :venue, :address, :zipcode, :city, :state, :start_time, :end_time, :end_time, :guestcount)
	end
	def datetime_builder(date,time)
		if date.present? && time.present?
			parse_date = Date.parse(date)
			parse_time = Time.parse(time)
			return DateTime.new(parse_date.year, parse_date.month, parse_date.day, parse_time.hour, parse_time.min)
		else 
			return nil
		end
	end
end
