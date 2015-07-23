Rails.application.routes.draw do
  root to: redirect("/docs")
  jsonapi_resources :players
  jsonapi_resources :matches
end
