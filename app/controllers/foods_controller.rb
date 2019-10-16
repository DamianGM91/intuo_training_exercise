class FoodsController < ApplicationController
	def index
		render json: Food.all, adapter: :json
	end

	def show
		render json: Food.find(params[:id]), adapter: :json
	end

	def find_by_type
		render json: Food.where(type: check_lowercase_params(params[:type])).all, adapter: :json
	end

	def create
		if %w(Cheese Milk Water Bread Meat Carrot Grass).include?(check_lowercase_params(params[:type]))
			params[:type] = check_lowercase_params(params[:type])
			food = Food.new(allowed_params)
			if food.save
				render json: {:message => "Food created", :data => food.reload}, adapter: :json
			else
				render json: {:message => "The food could not be created.", :errors => food.errors}, adapter: :json
			end
		else
			render json: {:message => "The allowed foods types are Milk, Water, Cheese, Bread, Meat, Carrot and Grass."}, adapter: :json
		end
	end

	def update
		food = Food.find(params[:id])
		if allowed_params.empty?
			render json: {:message => "No parameters were submitted in the request."}, adapter: :json
		elsif food.update_attributes(allowed_params)
			render json: {:message => "Food updated", :data => food.reload}, adapter: :json
		else
			render json: {:message => "The food could not be updated.", :errors => food.errors}, adapter: :json
		end
	end

	def destroy
		if Food.find(params[:id]).destroy
			render json: {:message => "Food deleted"}, adapter: :json
		end
	end

	private

	def allowed_params
		params.permit(:type, :fridge_id, :expiration_date, :brand, :volume, :size, :color)
	end
end
