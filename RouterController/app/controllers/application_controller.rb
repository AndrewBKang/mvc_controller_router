class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :validate_user, :except => [:login, :create]

  def validate_user
    render :json => {"message" => 'not logged in'} if params[:token].nil?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_token(params[:token])
  end

end
