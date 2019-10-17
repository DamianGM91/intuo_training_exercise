class HorsesController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Horse.all, each_serializer: HorseSerializer, adapter: :json
		else
			render json: Horse.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: HorseSerializer, adapter: :json
		end
	end

	def show
		render json: Horse.find(params[:id]), adapter: :json
	end

	def create
		horse = Horse.new(allowed_params)
		if horse.save
			render json: {:message => "Horse created.", :data => horse.reload}, adapter: :json
		else
			render json: {:message => "The horse could not be created.", :errors => horse.errors}, adapter: :json
		end
	end

	def update
		horse = Horse.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif horse.update_attributes(allowed_params)
			render json: {:message => "Horse updated.", :data => horse.reload}, adapter: :json
		else
			render json: {:message => "The horse could not be updated.", :errors => horse.errors}, adapter: :json
		end
	end

	def destroy
		if Horse.find(params[:id]).destroy
			render json: {:message => "Horse deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:name, :age, :favorite_food, :date_of_death, :owner_id)
	end
end
