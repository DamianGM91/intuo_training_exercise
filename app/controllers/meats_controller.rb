class MeatsController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Meat.all, each_serializer: MeatSerializer, adapter: :json
		else
			render json: Meat.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: MeatSerializer, adapter: :json
		end
	end

	def show
		render json: Meat.find(params[:id]), adapter: :json
	end

	def create
		meat = Meat.new(allowed_params)
		if meat.save
			render json: {:message => "Meat created.", :data => meat.reload}, adapter: :json
		else
			render json: {:message => "The meat could not be created.", :errors => meat.errors}, adapter: :json
		end
	end

	def update
		meat = Meat.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif meat.update_attributes(allowed_params)
			render json: {:message => "Meat updated.", :data => meat.reload}, adapter: :json
		else
			render json: {:message => "The meat could not be updated.", :errors => meat.errors}, adapter: :json
		end
	end

	def destroy
		if Meat.find(params[:id]).destroy
			render json: {:message => "Meat deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:fridge_id, :expiration_date, :brand)
	end
end
