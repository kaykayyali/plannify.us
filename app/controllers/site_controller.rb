class SiteController < ApplicationController
	before_action(:check_for_user)
	def index
		render 'index'
	end

	private
	def check_for_user
		if current_user.present? && current_user.role != "staff"
			redirect_to calendar_path
		elsif current_user.present? && current_user.role == "staff"
			render 'sorry'
		else
			render 'index'
		end
	end
end
