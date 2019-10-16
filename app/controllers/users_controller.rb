class UsersController < ApplicationController
	def index
		# paginate json: User.all, per_page: 25, adapter: :json_api
		render json: User.all, adapter: :json
	end

	def show
		render json: User.find(params[:id]), adapter: :json
	end

	def find_by_first_name
		render json: User.find_by(first_name: check_lowercase_params(params[:first_name])), adapter: :json
	end

	def find_by_last_name
		render json: User.find_by(last_name: check_lowercase_params(params[:last_name])), adapter: :json
	end

	def create
		user = User.new(allowed_params)
		if user.save
			render json: {:message => "User created", :data => user.reload}, adapter: :json
		else
			render json: {:message => "The user could not be created.", :errors => user.errors}, adapter: :json
		end
	end

	def update
		user = User.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif user.update_attributes(allowed_params)
			render json: {:message => "User updated", :data => user.reload}, adapter: :json
		else
			render json: {:message => "The user could not be updated.", :errors => user.errors}, adapter: :json
		end
	end

	def destroy
		if User.find(params[:id]).destroy
			render json: {:message => "User deleted"}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:first_name, :last_name, :email, :date_of_birth, :pet_count, :fridge_id)
	end
end
