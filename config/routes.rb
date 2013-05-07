MissingTranslations::Engine.routes.draw do
  get 'all' => "locales#index"

  I18n.available_locales.each do |locale|
    get locale.to_s => "locales#show", :as => "missing_translations_#{locale}", :locale => locale
  end

  root :to => "locales#index"
end
