# MissingI18n

This is a [rails 3 mountable engine](http://railscasts.com/episodes/277-mountable-engines).

It allows you to see which locales have missing entries. You probably want to use it in your development/staging environment.

## Installation

On your Gemfile:

    gem 'missing_i18n'

    # Note: this actually doesn't work yet, I have not published the gem
    # for now you can do this
    gem 'missing_i18n', :git => 'git://github.com/kikito/missing_i18n.git'

On your `config/routes.rb`:

    unless Rails.env.production? # optional, but recommended
      mount MissingI18n::Engine, :path => '/missing_i18n'
    end

## Customization

You can override MissingI18n' only view by creating any of the following files:

* `app/views/missing_i18n/locales/index.html.erb`
* `app/views/missing_i18n/locales/show.html.erb`

You can similarly override MissingI18n controller by defining `app/views/missing_i18n/locales_controller.rb`.

Finally, you will probably want to add "ignored paths" to `missing_i18n`, for example for avoiding certain groups of prefixes.

To ignore (for example) the entries inserted by the [Faker](http://faker.rubyforge.org/), create an initializer file with this text:

    # config/initializers/missing_i18n.rb

    if defined? MissingI18n
      MissingI18n.ignored_scopes << 'faker'
    end

## Tests

This engine has no tests. I'm basically using non-public methods from the i18n gem, so it's extremely brittle and coupled with the implementation details of i18n.

However, you can try the dummy app by executing:

    cd test/dummy
    rails s

If you then go to http://localhost:3000, you should see some differences between the es and en locales. Try modifying the files inside `test/dummy/config/locales` and
refreshing the page.

Feel free to send me pull requests with tests if you want!




