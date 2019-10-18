class GrassesController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Grass.all, each_serializer: GrassSerializer, adapter: :json
		else
			render json: Grass.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: GrassSerializer, adapter: :json
		end
	end

	def show
		render json: Grass.find(params[:id]), adapter: :json
	end

	def create
		grass = Grass.new(allowed_params)
		if grass.save
			render json: {:message => "Grass created.", :data => grass.reload}, adapter: :json
		else
			render json: {:message => "The grass could not be created.", :errors => grass.errors}, adapter: :json
		end
	end

	def update
		grass = Grass.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif grass.update_attributes(allowed_params)
			render json: {:message => "Grass updated.", :data => grass.reload}, adapter: :json
		else
			render json: {:message => "The grass could not be updated.", :errors => grass.errors}, adapter: :json
		end
	end

	def destroy
		if Grass.find(params[:id]).destroy
			render json: {:message => "Grass deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:fridge_id)
	end
end
