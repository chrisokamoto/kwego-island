Rails.application.routes.draw do
  resources :kwegonian_to_decimal_conversors

  root 'kwegonian_to_decimal_conversors#index'
end
