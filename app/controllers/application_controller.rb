class ApplicationController < ActionController::API
  include ActionController::ImplicitRender #Handles implicit rendering for a controller action that does not explicitly respond with render, respond_to, redirect, or head.
  respond_to :json


  rescue_from RailsParam::Param::InvalidParameterError do |exception|
    render json: {errors: exception}, status: 422 #catch rails_params exceptions and format error message
  end

  def default_serializer_options
    {root: false}
  end

end
