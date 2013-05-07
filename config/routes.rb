MissingTranslations::Engine.routes.draw do
  get '/'   => 'locales#index', :as => :locales
  get ':id' => 'locales#show',  :as => :locale
end
