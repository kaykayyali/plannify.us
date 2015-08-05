class SiteController < ApplicationController
	before_action(:check_for_user)
	def index
		render 'index'
	end

	private
	def check_for_user
		if current_user.present? && current_user.role != "staff"
			if current_user.profile.present?
				redirect_to calendar_path
			else
				flash.clear
				flash[:notice] = "Lets create a profile."
				redirect_to profile_path(current_user.id)
			end
		elsif current_user.present? && current_user.role == "staff"
			render 'sorry'
		else
			render 'index'
		end
	end
end
