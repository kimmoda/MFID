Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }  
  resources :fits do
    resources :comments
  end
  
  root 'fits#index'
end
