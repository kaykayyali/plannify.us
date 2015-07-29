class ProfilesController < ApplicationController
	def show
		@user = User.find_by(:id => params[:id])

		if @user.id = current_user.id

			render 'show'

		else
			if @user.role == "organizer"

				render 'show_organizer'
			elsif  @user.role == "vendor"

				render 'show_vendor'
			elsif  @user.role == "staff"

				render 'show_staff'
			end
		end
	end
end