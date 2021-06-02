Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  put 'commands/run', to: 'commands#run', constraints: { format: :json }
end
