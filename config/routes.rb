Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'breeds#index'

  resources :breeds, only: %i[index show]
end
