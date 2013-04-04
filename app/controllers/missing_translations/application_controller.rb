module MissingTranslations
  class ApplicationController < ActionController::Base
    def index
      @locales = Locale.all
    end
  end
end
