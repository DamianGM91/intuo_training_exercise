class ApplicationController < ActionController::Base
	include Rails::Pagination

	protect_from_forgery with: :null_session # Disable CSRF for requests to make API work.

	rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found
    render json: {:error => "Resource not found."}, :status => 404
  end

  def check_lowercase_params(params)
  	params == params.downcase ? params.capitalize : params
  end
end