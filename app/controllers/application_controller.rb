class ApplicationController < ActionController::Base
	include Rails::Pagination

	protect_from_forgery with: :null_session # Disable CSRF for requests to make API work.

	rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found
    render json: {:error => "Resource not found."}, :status => 404
  end

  def check_lowercase_params(params)
  	return if params == nil
  	params == params.downcase ? params.capitalize : params
  end

  def check_lowercase_queries(query)
    return if query == nil
    new_query = {}
    query.each do |key, value|
      new_value = check_lowercase_params(value)
      new_query[key] = new_value
    end
    new_query
  end
end