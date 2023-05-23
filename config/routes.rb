Rails.application.routes.draw do
  constraints format: :json do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'auth/registrations'
    }

## ======= 👇 ここから追加する =======
  resources :messages, only: ['index']
## ====== 👆 ここまで追加する =======

  end
end
