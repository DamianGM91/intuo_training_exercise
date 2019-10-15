class PetsController < ApplicationController
	def index
		render json: Pet.all, adapter: :json
	end

	def show
		render json: Pet.find(params[:id]), adapter: :json
	end

	def find_by_name
		render json: Pet.find_by(name: params[:name]), adapter: :json
	end

	def create
		pet = Pet.new(allowed_params)
		if pet.save
			render json: {:message => "Pet created", :data => pet.reload}, adapter: :json
		else
			render json: {:message => "The pet could not be created.", :errors => pet.errors}, adapter: :json
		end
	end

	def update
		pet = Pet.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif pet.update_attributes(allowed_params)
			render json: {:message => "Pet updated", :data => pet.reload}, adapter: :json
		else
			render json: {:message => "The pet could not be updated.", :errors => pet.errors}, adapter: :json
		end
	end

	def destroy
		if Pet.find(params[:id]).destroy
			render json: {:message => "Pet deleted"}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:name, :type, :age, :favorite_food, :date_of_death, :owner_id)
	end
end
