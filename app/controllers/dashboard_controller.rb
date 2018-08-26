class DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :set_slug_name

	private 
		def set_slug_name
			@slug = current_user.profile.slug
		end
end
