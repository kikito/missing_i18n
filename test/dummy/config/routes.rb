Rails.application.routes.draw do
  mount MissingTranslations::Engine => "/missing_translations"
  root :to => redirect("/missing_translations")
end
