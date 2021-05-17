Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'users', to: "users#create"
  post 'csv', to: "users#parse_csv"
  post 'login', to: "authentication#login"
  
  resources :meditations, only: [:index]

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end
  post "/graphql", to: "graphql#execute"
end
