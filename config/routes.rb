Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "lists#index"

  # don't need movies resources because they don't have individual pages,
  # they appear on other pages
  # always think about what you want to present on what page
  # in this case we want to see lists, not movies

  resources :lists, except: [:edit, :update] do
    # when we create a bookmark we need to know what list it belongs to
    # when we delete a bookmark we don't need to know the list it belongs to
    # just need to know the id of the bookmark itself
    resources :bookmarks, except: [:destroy, :edit, :update]
    resources :reviews, except: [:destroy, :edit, :update]
  end

  # hence the destroy action is outside of the nesting
  resources :bookmarks, only: [:destroy]
  resources :reviews, only: [:destroy]
end
