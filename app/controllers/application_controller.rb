class ApplicationController < ActionController::API
  def index
    render plain: "Hello world!", status: 200
  end
end
