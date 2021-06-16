Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # enables us to browse the stats_controller index action
  # get '/stats', to: 'stats#index'
  # get '/admin/stats', to: 'stats#index'
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'

  # In routing, scope allows us to prefix a block of routes under one grouping.
  scope '/admin', module: 'admin' do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
