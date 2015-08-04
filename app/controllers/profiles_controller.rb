class ProfilesController < ApplicationController
	def show
		@user = User.find_by(:id => params[:id])
		if @user.profile.nil?
			@user.profile = Profile.new
		end
		@profile = @user.profile
		@services = Service.all
		render 'show'
	end

	def update
		profile = current_user.profile
		address = params[:profile][:address].split(',') 
		params[:profile][:address] = address[0]
		if profile.update_attributes(profile_params)
			if AssociatedService.find_by(:user_id => current_user.id).present?
				AssociatedService.all.where(:user_id == current_user.id.to_s).destroy_all
			end
			AssociatedService.create(user_id: current_user.id, service_id: params[:profile][:service_type])
			redirect_to (profile_path(current_user))
		else
			flash[:alert] = "Update Failed"
			redirect_to ('/profiles/'+current_user.id)
		end
	end
	private
	def profile_params
		
		params.require(:profile).permit(:service_type, :user_id, :first_name, :owner, :city, :state, :weburl, :last_name, :name, :email , :phone, :imageurl, :rating, :description, :address, :message, :zipcode )
	end
	
end