MissingTranslations::Engine.routes.draw do
  get 'all' => "missing_translations#index"

  I18n.available_locales.each do |locale|
    get locale.to_s => "missing_translations#show", :as => "missing_translations_#{locale}", :locale => locale
  end

  root :to => "missing_translations#index"
end
