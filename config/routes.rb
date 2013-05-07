MissingI18n::Engine.routes.draw do
  get '/'   => 'locales#index', :as => :locales
  get ':id' => 'locales#show',  :as => :locale
end
