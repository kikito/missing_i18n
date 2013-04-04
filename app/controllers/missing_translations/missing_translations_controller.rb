module MissingTranslations
  class MissingTranslationsController < ApplicationController
    def index
      @locales = Locale.all
    end
  end
end
