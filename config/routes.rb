Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }

  resources :messages, only: ['index'] do
    member do
      resources :likes, only: ['create']
    end
  end

  ## ======= 👇 ここから追加する =======
  resources :likes, only: ['destroy']
  ## ====== 👆 ここまで追加する =======
end
