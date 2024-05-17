Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'breed_searches#new'

  resource :breed_searches, only: %i[new show]
end
