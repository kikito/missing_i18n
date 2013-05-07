module MissingTranslations
  class LocalesController < ApplicationController
    def index
      @locales = Locale.all
    end

    def show
      @locale = Locale.new(params[:locale])
      respond_to do |format|
        format.html
        format.yaml {
          render :text => @locale.to_yaml, :content_type => 'text/yaml'
        }
      end
    end
  end
end
