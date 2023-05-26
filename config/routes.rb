Rails.application.routes.draw do
  resources :ir_analyses
  resources :asset_note_groups
  resources :uav_tank_wall_to_roof_joint_details
  resources :uav_tank_wall_floor_joint_details
  resources :uav_tank_vegetation_details
  resources :uav_tank_top_vent_details
  resources :uav_tank_security_details
  resources :uav_tank_roof_structure_details
  resources :uav_tank_roof_safety_tie_off_details
  resources :uav_tank_roof_coating_details
  resources :uav_tank_rain_incursion_details
  resources :uav_tank_perimeter_vent_details
  resources :uav_tank_perimeter_footing_details
  resources :uav_tank_overflow_details
  resources :uav_tank_lightning_protection_details
  resources :vibration_analysis_screenshot_comments
  resources :vibration_validations
  resources :vibration_recommendation_ranks
  resources :vibration_fault_components
  resources :vibration_fault_categories
  resources :alignment_inspections
  resources :align_repairs
  resources :align_checks

  get 'welcome/index', to: 'welcome#index'
  root "welcome#index"


  resources :sites do
    get :site_areas_by_site, on: :collection
  end

  resources :site_areas do
    get :site_rooms_by_area, on: :collection
  end

  resources :site_rooms do
    get :assets_by_room, on: :collection
  end

  resources :vibration_analysis, only: [:new, :create]

  get '/sites', to: 'sites#index'

  get '/database_poll', to: 'database_poll#index'

  get '/screenshot', to: 'screenshot#index'

  get '/vibration', to: 'vibration_analysis#index'

  get '/vibration_menu', to: 'vibration_menu#vibration_index'
 
  # Route the capture action to the screenshot capture module in screenshot controller.
  post 'capture' => 'screenshot#capture'

end

