Rails.application.routes.draw do
  mount Raddocs::App => "/docs"
  root to: redirect("/docs")
  jsonapi_resources :players
  jsonapi_resources :matches
end
