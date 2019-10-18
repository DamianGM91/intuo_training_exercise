class CarrotsController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Carrot.all, each_serializer: CarrotSerializer, adapter: :json
		else
			render json: Carrot.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: CarrotSerializer, adapter: :json
		end
	end

	def show
		render json: Carrot.find(params[:id]), adapter: :json
	end

	def create
		carrot = Carrot.new(allowed_params)
		if carrot.save
			render json: {:message => "Carrot created.", :data => carrot.reload}, adapter: :json
		else
			render json: {:message => "The carrot could not be created.", :errors => carrot.errors}, adapter: :json
		end
	end

	def update
		carrot = Carrot.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif carrot.update_attributes(allowed_params)
			render json: {:message => "Carrot updated.", :data => carrot.reload}, adapter: :json
		else
			render json: {:message => "The carrot could not be updated.", :errors => carrot.errors}, adapter: :json
		end
	end

	def destroy
		if Carrot.find(params[:id]).destroy
			render json: {:message => "Carrot deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:fridge_id, :expiration_date, :brand, :color)
	end
end
