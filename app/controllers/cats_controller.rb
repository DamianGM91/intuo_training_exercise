class CatsController < ApplicationController
	def index
		if params.include?(:name)
			render json: Cat.find_by(name: check_lowercase_params(params[:name])), adapter: :json
		else
			render json: Cat.all, adapter: :json
		end
	end

	def show
		render json: Cat.find(params[:id]), adapter: :json
	end

	def create
		cat = Cat.new(allowed_params)
		if cat.save
			render json: {:message => "Cat created.", :data => cat.reload}, adapter: :json
		else
			render json: {:message => "The cat could not be created.", :errors => cat.errors}, adapter: :json
		end
	end

	def update
		cat = Cat.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif cat.update_attributes(allowed_params)
			render json: {:message => "Cat updated.", :data => cat.reload}, adapter: :json
		else
			render json: {:message => "The cat could not be updated.", :errors => cat.errors}, adapter: :json
		end
	end

	def destroy
		if Cat.find(params[:id]).destroy
			render json: {:message => "Cat deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:name, :age, :favorite_food, :date_of_death, :owner_id)
	end
end
