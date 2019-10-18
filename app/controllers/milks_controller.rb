class MilksController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Milk.all, each_serializer: MilkSerializer, adapter: :json
		else
			render json: Milk.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: MilkSerializer, adapter: :json
		end
	end

	def show
		render json: Milk.find(params[:id]), adapter: :json
	end

	def create
		milk = Milk.new(allowed_params)
		if milk.save
			render json: {:message => "Milk created.", :data => milk.reload}, adapter: :json
		else
			render json: {:message => "The milk could not be created.", :errors => milk.errors}, adapter: :json
		end
	end

	def update
		milk = Milk.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif milk.update_attributes(allowed_params)
			render json: {:message => "Milk updated.", :data => milk.reload}, adapter: :json
		else
			render json: {:message => "The milk could not be updated.", :errors => milk.errors}, adapter: :json
		end
	end

	def destroy
		if Milk.find(params[:id]).destroy
			render json: {:message => "Milk deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:fridge_id, :expiration_date, :brand, :volume)
	end
end
