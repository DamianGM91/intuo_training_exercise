class MiceController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Mouse.all, each_serializer: MouseSerializer, adapter: :json
		else
			render json: Mouse.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: MouseSerializer, adapter: :json
		end
	end

	def show
		render json: Mouse.find(params[:id]), adapter: :json
	end

	def create
		mouse = Mouse.new(allowed_params)
		if mouse.save
			render json: {:message => "Mouse created.", :data => mouse.reload}, adapter: :json
		else
			render json: {:message => "The mouse could not be created.", :errors => mouse.errors}, adapter: :json
		end
	end

	def update
		mouse = Mouse.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif mouse.update_attributes(allowed_params)
			render json: {:message => "Mouse updated.", :data => mouse.reload}, adapter: :json
		else
			render json: {:message => "The mouse could not be updated.", :errors => mouse.errors}, adapter: :json
		end
	end

	def destroy
		if Mouse.find(params[:id]).destroy
			render json: {:message => "Mouse deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:name, :age, :favorite_food, :date_of_death, :owner_id)
	end
end
