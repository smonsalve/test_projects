Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :comites do
    resources :comites, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :comites, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :comites, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
