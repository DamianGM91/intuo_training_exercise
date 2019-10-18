class WatersController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Water.all, each_serializer: WaterSerializer, adapter: :json
		else
			render json: Water.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: WaterSerializer, adapter: :json
		end
	end

	def show
		render json: Water.find(params[:id]), adapter: :json
	end

	def create
		water = Water.new(allowed_params)
		if water.save
			render json: {:message => "Water created.", :data => water.reload}, adapter: :json
		else
			render json: {:message => "The water could not be created.", :errors => water.errors}, adapter: :json
		end
	end

	def update
		water = Water.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif water.update_attributes(allowed_params)
			render json: {:message => "Water updated.", :data => water.reload}, adapter: :json
		else
			render json: {:message => "The water could not be updated.", :errors => water.errors}, adapter: :json
		end
	end

	def destroy
		if Water.find(params[:id]).destroy
			render json: {:message => "Water deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:fridge_id)
	end
end
