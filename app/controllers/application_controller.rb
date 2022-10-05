class ApplicationController < ActionController::Base
	@current_user = User.find(1)
end
