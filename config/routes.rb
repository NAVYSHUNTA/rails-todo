Rails.application.routes.draw do
  root "todos#index"
  get "/todos", to: "todos#index", as: "index"
  get "/todos/:id", to: "todos#show", as: "show"
end
