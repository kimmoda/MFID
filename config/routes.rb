Rails.application.routes.draw do
  resources :fits
  
  root 'fits#index'
end
