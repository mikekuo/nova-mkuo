class ApplicationController < ActionController::API

  before_action :check_params

  def index
    if @user.nil?
      create_user
    end
  end

  protected

  def check_params
    @email = params[:email]
    @user_id = params[:user_id]
    render_malformed if params[:email] == nil && params[:user_id] == nil
  end

  def create_user
    if User.where(email: @email).any?
      render_unauthorized
    else
      user = User.new(email: @email)
      user.save
      render_user(user)
    end
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
