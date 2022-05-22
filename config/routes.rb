Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :chat_applications,  param: :token do
        resources :chats, only: [:create, :index, :show], param: :number do
          resources :messages, only: [:create, :index, :show], param: :number
        end
      end
    end
  end
end
