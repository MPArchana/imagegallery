Rails.application.routes.draw do
  resources :galleries do 
    get :multiple_categories, on: :member
    post :tag_images, on: :member
    get :all_photos, on: :collection
  end

  resources :categories
  
  root "galleries#index"
end
