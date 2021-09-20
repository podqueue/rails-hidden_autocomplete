Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hidden_autocompletes/index'
  root to: 'hidden_autocompletes#index'
end
