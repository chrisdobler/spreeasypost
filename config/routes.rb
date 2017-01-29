Spree::Core::Engine.routes.draw do
  # Add your extension routes here  
  namespace :easy_post do
  	resources :order, only:[:index] do
	    resources :postage, only: [:create] do 
		  end
		end
  end
end
