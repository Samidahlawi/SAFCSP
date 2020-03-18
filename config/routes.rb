Rails.application.routes.draw do
  

  
  
  
  resources :groups do
    resources :reports do 
      resources :documents
    end
  end

  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
