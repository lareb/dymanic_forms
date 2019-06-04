Rails.application.routes.draw do
  get 'home/submit_form'
  resources :forms do
    resources :form_elements
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
