class CheesesController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Cheese.all, each_serializer: CheeseSerializer, adapter: :json
		else
			render json: Cheese.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: CheeseSerializer, adapter: :json
		end
	end

	def show
		render json: Cheese.find(params[:id]), adapter: :json
	end

	def create
		cheese = Cheese.new(allowed_params)
		if cheese.save
			render json: {:message => "Cheese created.", :data => cheese.reload}, adapter: :json
		else
			render json: {:message => "The cheese could not be created.", :errors => cheese.errors}, adapter: :json
		end
	end

	def update
		cheese = Cheese.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif cheese.update_attributes(allowed_params)
			render json: {:message => "Cheese updated.", :data => cheese.reload}, adapter: :json
		else
			render json: {:message => "The cheese could not be updated.", :errors => cheese.errors}, adapter: :json
		end
	end

	def destroy
		if Cheese.find(params[:id]).destroy
			render json: {:message => "Cheese deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:fridge_id, :expiration_date, :brand)
	end
end
