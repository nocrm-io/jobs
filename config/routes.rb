Rails.application.routes.draw do
  resources :leads
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "leads#index"
end
