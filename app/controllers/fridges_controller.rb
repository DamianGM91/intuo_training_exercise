class FridgesController < ApplicationController
	def index
		if request.query_parameters.empty?
			render json: Fridge.all, each_serializer: FridgeSerializer, adapter: :json
		else
			render json: Fridge.where(check_lowercase_queries(request.query_parameters)).all, each_serializer: FridgeSerializer, adapter: :json
		end
	end

	def show
		render json: Fridge.find(params[:id]), adapter: :json
	end

	def create
		if %w(Siemens Whirpool AEG).include?(check_lowercase_params(params[:brand]))
			params[:brand] = check_lowercase_params(params[:brand])
		end

		fridge = Fridge.new(allowed_params)
		if fridge.save
			render json: {:message => "Fridge created.", :data => fridge.reload}, adapter: :json
		else
			render json: {:message => "The fridge could not be created.", :errors => fridge.errors}, adapter: :json
		end
	end

	def update
		fridge = Fridge.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif fridge.update_attributes(allowed_params)
			render json: {:message => "Fridge updated.", :data => fridge.reload}, adapter: :json
		else
			render json: {:message => "The fridge could not be updated.", :errors => fridge.errors}, adapter: :json
		end
	end

	def destroy
		if Fridge.find(params[:id]).destroy
			render json: {:message => "Fridge deleted."}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:brand, :last_technical_check, :owner_id)
	end
end
