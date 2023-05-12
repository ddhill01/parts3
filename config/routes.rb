Rails.application.routes.draw do

  get 'welcome/index', to: 'welcome#index'
  root "welcome#index"

  resources :sites do
    get :site_areas_by_site, on: :collection
  end

  resources :site_areas do
    get :site_rooms_by_area, on: :collection
  end

  resources :site_rooms do
    get :room_assets_by_room, on: :collection
  end

  get '/sites', to: 'sites#index'

  get '/database_poll', to: 'database_poll#index'

  get '/screenshot', to: 'screenshot#index'

  # Route the capture action to the screenshot capture module in screenshot controller.
  post 'capture' => 'screenshot#capture'

end

