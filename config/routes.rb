Rails.application.routes.draw do
  post '/' => "application#index", as: "root"
end
