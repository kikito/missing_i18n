# MissingTranslations

This is a [rails 3 mountable engine](http://railscasts.com/episodes/277-mountable-engines).

It allows you to see which locales have missing entries. You probably want to use it in your development/staging environment.

## Installation

On your Gemfile:

    gem 'missing_translations'

    # Note: this actually doesn't work yet, I have not published the gem
    # for now you can do this
    gem 'missing_translations', :git => 'git://github.com/kikito/missing_translations.git'

On your `config/routes.rb`:

    unless Rails.env.production? # optional, but recommended
      mount MissingTranslations::Engine, :path => '/missing_translations'
    end

## Customization

You can (and are encouraged to) override MissingTranslations' only view by creating a file in
`app/views/missing_translations/missing_translations/index.html.erb` (notice the double `missing_translations` here.
One is the engine, the other is the controller).

You can similarly override MissingTranslations controller by defining `app/views/missing_translations/missing_translations_controller.rb`.

## Tests

This engine has no tests, as I'm basically using non-public methods from the i18n gem.

Sorry. Feel free to send me pull requests for them if you want!




