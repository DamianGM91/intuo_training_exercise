class DogsController < ApplicationController
	def index
		if params.include?(:name)
			render json: Dog.find_by(name: check_lowercase_params(params[:name])), adapter: :json
		else
			render json: Dog.all, adapter: :json
		end
	end

	def show
		render json: Dog.find(params[:id]), adapter: :json
	end

	def create
		dog = Dog.new(allowed_params)
		if dog.save
			render json: {:message => "Dog created.", :data => dog.reload}, adapter: :json
		else
			render json: {:message => "The dog could not be created.", :errors => dog.errors}, adapter: :json
		end
	end

	def update
		dog = Dog.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif dog.update_attributes(allowed_params)
			render json: {:message => "Dog updated.", :data => dog.reload}, adapter: :json
		else
			render json: {:message => "The dog could not be updated.", :errors => dog.errors}, adapter: :json
		end
	end

	def destroy
		if Dog.find(params[:id]).destroy
			render json: {:message => "Dog deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:name, :age, :favorite_food, :date_of_death, :owner_id)
	end

end
