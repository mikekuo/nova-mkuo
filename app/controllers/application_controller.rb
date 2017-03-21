class ApplicationController < ActionController::API

  before_action :authenticate

  def index
    if @user.nil? # New user request since existing user not found
      create_user
    else
      show
    end
  end

  protected

  def authenticate
    @email = params[:email]
    @user_id = params[:user_id]
    if params[:email] == nil && params[:user_id] == nil
      render_malformed
      return
    end

    @token = request.headers["Authorization"]
    if @token == nil
      render_unauthorized
      return
    end
    @user = User.where(token: @token, email: @email).first
  end

  def show
    resp = @user.attributes
    if @user.team_access # Show team information if user has team_access
      resp.merge!(team: @user.team.attributes)
    end
    render json: resp, status: 200
  end

  def create_user
    if User.where(email: @email).any? # Restrict creating user with same email
      render_unauthorized
      return
    else
      user = User.new(email: @email, name: params[:name])
      user.save
      render_user(user)
      return
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
