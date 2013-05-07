Rails.application.routes.draw do
  mount MissingI18n::Engine => "/missing_i18n"
  root :to => redirect("/missing_i18n")
end
