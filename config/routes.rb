Rails.application.routes.draw do
  resources :employment_contracts, path: 'setup_request' do 
    member do
      get :offer_settings
      put :update_offer_letter
      put :approve_request
    end
  end
  resources :request_steps, path: '/editing_request'


  resources :positions
  resources :employees
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }

  resource :word_doc, only: :show, format: 'docx'

  get :send_notification_email, to: 'employment_contracts#send_notification_email', as: :send_notification_email

  root to: 'homepage#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
