Rails.application.routes.draw do
  get 'slam', to: 'slam#index'
  get '/gpt_chats', to: 'gpt_chats#index'
  get '/gpt_chats/search', to: 'gpt_chats#search', as: 'search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
