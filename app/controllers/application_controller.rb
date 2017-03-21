class ApplicationController < ActionController::API

  before_action :check_params

  def create
    if User.where(email: params[:email]).any?
      render_unauthorized
    else
      user = User.new(email: params[:email])
      user.save
      render_user(user)
    end
  end

  protected

  def check_params
    render_malformed if params[:email] == nil && params[:user_id] == nil
  end

  def render_malformed
    render plain: "Malformed request.", status: 400
  end

  def render_unauthorized
    render plain: "Unauthorized credentials.", status: 403
  end

  def render_user(user)
    render json: user, status: 200
  end
end
