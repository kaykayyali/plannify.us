class OrganizersController < ApplicationController
	before_action(:authenticate_user!)
	before_action(:ensure_organizer)

	def show
		@events = current_user.events
		render 'show'
	end

	def new
		
		render 'new'
	end
	def create
		event = current_user.events.new(event_params)
		if event.save
			
			redirect_to organizers_path
		else
			redirect_to organizers_addevent_path
		end
			
		
	end

	private

	def ensure_organizer
		unless current_user.role == "organizer"
			redirect_to '/'
		end
	end

		def event_params
		params.require(:event).permit(:name, :date, :venue, :address, :zipcode, :city, :state)
	end
end
