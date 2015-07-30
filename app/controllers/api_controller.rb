class ApiController < ApplicationController
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
	private 
	  def format_date(date)
    return date.strftime('%B, %e %Y at %l:%M %P')
  end
end
