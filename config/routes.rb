Rails.application.routes.draw do
  match 'login', to: 'auth#update', via: :post

  scope 'api' do
    scope 'v1' do
      scope 'users/:username' do
        resources :dictionaries do
          resources :translations
        end
      end
    end
  end
end
