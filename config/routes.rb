Bookapp::Application.routes.draw do
  root to: "sites#index"
  resources :books
end
