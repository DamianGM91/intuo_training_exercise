class BreadsController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Bread.all, each_serializer: BreadSerializer, adapter: :json
		else
			render json: Bread.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: BreadSerializer, adapter: :json
		end
	end

	def show
		render json: Bread.find(params[:id]), adapter: :json
	end

	def create
		bread = Bread.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif bread.update_attributes(allowed_params)
			render json: {:message => "Bread updated.", :data => bread.reload}, adapter: :json
		else
			render json: {:message => "The bread could not be updated.", :errors => bread.errors}, adapter: :json
		end
	end

	def update
		bread = Bread.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif bread.update_attributes(allowed_params)
			render json: {:message => "Bread updated.", :data => bread.reload}, adapter: :json
		else
			render json: {:message => "The bread could not be updated.", :errors => bread.errors}, adapter: :json
		end
	end

	def destroy
		if Bread.find(params[:id]).destroy
			render json: {:message => "Bread deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:fridge_id, :expiration_date, :brand, :size)
	end
end
