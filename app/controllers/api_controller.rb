class ApiController < ApplicationController
	before_action(:authenticate_user!)
	def get_comments

		event = Event.find_by(:id => params[:id])
		commentsArray = []

    	event.comments.each do |comment|
    		textalign = "text-align:right;"
    		color = "color:#c7254e;"
    	
    		if User.find_by(:id =>comment.user_id).role == "organizer"
    			textalign = "text-align:left;"
    			color = "color:#0E8FAB;"
    		end

    		styles = "style='"+ textalign + color + "'"

	      commentFirstname = "<a href= '/profiles/#{comment.user_id}'"+styles + ">" + User.find_by(:id => comment.user_id).first_name
	      commentLastname = User.find_by(:id => comment.user_id).last_name + "</a>"
	      commentUsername = commentFirstname + " " + commentLastname
	      
	      newComment = {
	          :user => commentUsername,
	          :content => comment.content,
	          :date => format_date(comment.created_at)
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
		vendor = User.find_by(name: params[:name])

		associatedServ = AssociatedService.where(:service_id => serv.id, :user_id => vendor.id )
		p associatedServ


		if associatedServ.present? && check_for_confirmed_service(event, associatedServ) == false
			confirmed = ConfirmedService.create(:event_id => event.id, :associated_service_id => associatedServ[0].id)
			event.confirmed_services.push(confirmed)
			confirmed.id
			render json: {
				confirmed_service: confirmed.id,
				vendor_name: vendor.name,
				service_name: serv.name
			}
		else
			render status: 404 , json: {response: "Failed"}
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
			title: vendor.name,
			owner: vendor.owner,
			services: vendor.services,
			email: vendor.email
		}
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
