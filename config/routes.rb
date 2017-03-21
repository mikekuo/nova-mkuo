Rails.application.routes.draw do
  post '/' => "application#create", as: "root"
end
