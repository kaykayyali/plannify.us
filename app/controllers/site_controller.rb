class SiteController < ApplicationController
	before_action(:check_for_user)
	def index
		render 'index'
	end

	private
	def check_for_user
		if current_user.present?
			if current_user.role == "vendor"
				redirect_to "/vendor"
			elsif current_user.role == "organizer"
				redirect_to "/organizer"
			elsif current_user.role == "staff"
				redirect_to "/staff"
			end		
		end
	end
end
