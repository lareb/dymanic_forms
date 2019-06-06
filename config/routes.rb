Rails.application.routes.draw do
  get 'home/submit_form'
  post 'home/create', defaults: { format: 'json' }
  resources :forms do
    resources :form_elements
    member do
      get :preview, to: 'form_elements#preview'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
