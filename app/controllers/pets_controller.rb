class PetsController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Pet.all, each_serializer: PetSerializer, adapter: :json
		else
			render json: Pet.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: PetSerializer, adapter: :json
		end
	end

	def show
		render json: Pet.find(params[:id]), adapter: :json
	end

	def create
		if %w(Cat Dog Horse Mouse).include?(check_lowercase_params(params[:type]))
			params[:type] = check_lowercase_params(params[:type])
			pet = Pet.new(allowed_params)
			if pet.save
				render json: {:message => "Pet created.", :data => pet.reload}, adapter: :json
			else
				render json: {:message => "The pet could not be created.", :errors => pet.errors}, adapter: :json
			end
		else
			render json: {:message => "Valid pets are restricted to Cat, Dog, Horse and Mouse."}, adapter: :json
		end
	end

	def update
		pet = Pet.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif pet.update_attributes(allowed_params)
			render json: {:message => "Pet updated.", :data => pet.reload}, adapter: :json
		else
			render json: {:message => "The pet could not be updated.", :errors => pet.errors}, adapter: :json
		end
	end

	def destroy
		if Pet.find(params[:id]).destroy
			render json: {:message => "Pet deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:name, :type, :age, :favorite_food, :date_of_death, :owner_id)
	end
end
