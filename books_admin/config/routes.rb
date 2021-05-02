Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/books/:id" => "books#show" # /books/:idにgetアクセスすると、books_controllerのshowアクションを呼び出す
  delete "/books/:id" => "books#destroy"
end
