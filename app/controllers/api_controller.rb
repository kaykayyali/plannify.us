class ApiController < ApplicationController
	before_action(:authenticate_user!)
	def unread_get
		user = User.find_by_id(params[:id])
		render json: {count: user.messages_to.unread.count}
	end
	def confirm_all
		user = User.find_by_id(params[:id])
		user.messages_to.unread.map do |msg| 
			msg.read = true
			msg.save
		end
		render json: {response: "Complete"}, status: 200
	end
	def redact
		Event.find_by_id(params[:id]).comments.where(:content => "My company would like to offer our services for this event!").where(:user_id => current_user.id).destroy_all
		render json: {response: "Complete"}, status: 200
	end
	def confirm_event
		event = Event.find_by_id(params[:id])
		event.confirmed = true
		event.save
		vendors = event.confirmed_services.map { |cs| cs.vendor }
		vendors.each do |vendor|
			body = "#{current_user.name} has confimed #{vendor.name} for #{event.name}"
			Comment.create(event_id: params[:id], user_id: current_user.id, content: body )
			Message.create(from_id: current_user.id, to_id: vendor.id, content: body)
		end


		redirect_to organizers_event_path(event.id)
	end
	def get_comments

		event = Event.find_by(:id => params[:id])
		comments = event.comments.all.order(:id => :DESC)
		commentsArray = []

    	comments.each do |comment|
	      commentUsername = User.find_by(:id => comment.user_id).name 
	      content_fix = comment.content
	      if comment.content.nil?
	      	content_fix = ""
	      end
	      newComment = {
	          :user => commentUsername,
	          :content => content_fix,
	          :date => format_date(comment.created_at),
	          :role => User.find_by(:id => comment.user_id).role,
	          :companyName => User.find_by(:id => comment.user_id).profile.name
	      }

	      commentsArray.push(newComment)
	    end

		if event.present?

			render :status => 200 , :json => commentsArray
		else
			render :status => 404, :json => {:response => "Failed to retrive comments"}
		end


	end

	def add_comments
		event = Event.find_by(:id => params[:id])
		newComment = Comment.create(:content => params[:text], :user_id => current_user.id)
    	event.comments.push(newComment)

   
    render :status => 200, :json => {:response => "Success"}
		
	end

	def add_service
		event = Event.find_by(id: params[:eventid])
		serv = Service.find_by(name: params[:service])
		vendor = Profile.find_by(name: params[:name])
		

		associatedServ = AssociatedService.where(:service_id => serv.id, :user_id => vendor.user_id )
		


		if associatedServ.present? && check_for_confirmed_service(event, associatedServ) == false
			confirmed = ConfirmedService.create(:event_id => event.id, :associated_service_id => associatedServ[0].id)
			event.confirmed_services.push(confirmed)
			p confirmed.id
			render json: {
				confirmed_service: confirmed.id,
				vendor_name: vendor.name,
				service_name: serv.name,
				event: event.id,
				vendor_id: vendor.id,
				image_url: vendor.imageurl
			}
		else
			render status: 300 , json: {response: "Failed"}
		end
		

		
	end
	def delete_confirmed_service
		event = Event.find_by(id: params[:id])
		serv = ConfirmedService.find_by(id: params[:service_id])
		serv.destroy
		render json: {response: serv.id}
		
	end

	def vendor_info
		vendor = User.find_by(id: params[:id])
		render json: {
			title: vendor.profile.name,
			owner: vendor.profile.owner,
			services: vendor.profile.service_type,
			email: vendor.profile.email
		}
	end

	def send_cancellation
		if current_user.present?

			message = Message.new
			messageContent = User.find_by(:id => current_user.id).first_name + " has confirmed you as a provider for " + Event.find_by(:id => params[:event_id]).name + "."
			message.content = messageContent
			message.from_id = current_user.id
			message.to_id = User.find_by(:name => params[:vendor_name]).id
			p params[:vendor_name]
			message.save
			render json: {response: "Sent to " + message.to_id}, status: 200
		end
		
	end


	def send_confirmation
		if current_user.present?

			message = Message.create()
			messageContent = User.find_by(:id => current_user.id).first_name + " has confirmed you as a provider for " + Event.find_by(:id => params[:event_id]).name + "."
			message.content = messageContent
			message.from_id = current_user.id
			message.to_id = User.find_by(:name => params[:vendor_name]).id
			p params[:vendor_name]
			message.save
			render json: {response: "Sent to " + message.to_id}, status: 200
		end
		
	end
	def serve_messages
		messages = Message.all.where(:to_id => params[:id]).order(:id => :DESC)
		messagesArray = []
		messages.each do |message|

			textalign = "text-align:right;"
    		color = "color:#c7254e;"
    	
    		if User.find_by(:id =>message.from_id).role == "organizer"
    			textalign = "text-align:left;"
    			color = "color:#0E8FAB;"
    		end

    		styles = "style='"+ textalign + color + "'"

	      messageFirstname = "<a href= '/profiles/#{message.from_id}'"+styles + ">" + User.find_by(:id => message.from_id).first_name
	      messageLastname = User.find_by(:id => message.from_id).last_name + "</a>"
	      messageUsername = messageFirstname + " " + messageLastname
			
			newMessage = {
	          :user => messageUsername,
	          :content => message.content,
	          :date => format_date(message.created_at)
	      }
	      messagesArray.push(newMessage)

		end
		if messages.present?

			render :status => 200 , :json => messagesArray
		else
			render :status => 404, :json => {:response => "Failed to retrive comments"}
		end
		
		
	end
	def calendar
		render 'calendar'
	end
	def check_confirmed
		response = "confirmed"
		unless Event.find_by_id(params[:id]).confirmed 
			response = "open"
		end
		render json: {response: response}
	end
	def send_events
		if current_user.role == "organizer"
			eventFilter = current_user.events
			url_to = '/organizers/showevent/'
		elsif current_user.role == "vendor"
			url_to ='/vendors/examineevent/'
			eventFilter = Event.all
		end
		events = eventFilter
		eventsArray = []
		events.each do |event|
			newEvent = {
				title: event.name,
				start: event.start_date,
				url: url_to + event.id.to_s,
				allDay: false,
       			editable: true
			}
			eventsArray.push(newEvent)
		end

		render json: eventsArray, status: 200

	end

	private 
	  def format_date(date)
    return date.strftime('%B, %e %Y at %l:%M %P')
  	end
  	def check_for_confirmed_service(event, assoc)
  		associated = false

  		event.confirmed_services.each do |serv|
  			if serv.associated_service_id == assoc[0].id
  				associated = true
  			end
  		end
  		if associated == true
  			p associated
  			return true
  		else
  			p associated
  			return false
  		end
  			
  	end
end
