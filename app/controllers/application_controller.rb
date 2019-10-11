class ApplicationController < ActionController::Base
	def json_test
		user = {:first_name => "Damián", last_name: "González", date_of_birth: Time.parse('1991-12-31 11am').in_time_zone('Madrid')}
		render json: user
	end
end