Rails.application.routes.draw do
	namespace :api, :defaults => { :format => :json } do
		namespace :vi do
			get "/trains" => "trains#index", :as => :trains
			get "/trains/:train_number" => "trains#show", :as => :train

			get "/reservations/:booking_code" => "reservations#show", :as => :reservation
			post "/reservations" => "reservations#create", :as => :create_reservations
			patch "/reservations/:booking_code" => "reservations#update", :as => :update_reservation
			delete "/reservations/:booking_code" => "reservations#destroy", :as => :cancel_reservation
		end
	end
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :cities do
		member do
			post :update_temp
		end
	end
end
