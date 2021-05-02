Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/books/:id" => "books#show" # /books/:idにgetアクセスすると、books_controllerのshowアクションを呼び出す
  delete "/books/:id" => "books#destroy"

  resources :publishers # この1行だけでCRUDが定義される

  # resourcesの中に複雑なルーティングを定義する
  resources :publishers do
    resources :books # 親子関係を定義する /publisher/:publisher_id/books/:id

    member do # publisherの個別リソースに対して定義する /publishers/:id/detail
      get 'detail'
    end

    collection do # publisher全体に対して定義する /publishers/search
      get 'search'
    end
  end

  # 一人のユーザから見て一つしか存在しないリソースのCRUDはresource(単数形)で定義
  resource :profile # /profile
end
