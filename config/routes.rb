Rails.application.routes.draw do
	root 'home#home'
	get 'home/home'
	get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end