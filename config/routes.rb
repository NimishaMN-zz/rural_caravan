Rails.application.routes.draw do
  resources :activity_details
  resources :work_details
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
